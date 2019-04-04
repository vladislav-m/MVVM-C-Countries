//
//  APIComponentImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift
import Moya
import RxSwiftExt

/// Default implementation of APIComponent protocol
class APIComponentImp: APIComponent {

    // MARK: - Private vars

    private var provider: MoyaProvider<APIRequest>
    private let backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated)

    // MARK: - Lifecycle

    init(provider: MoyaProvider<APIRequest>) {
        self.provider = provider
    }

    // MARK: - APIComponent

    func getData(for request: APIRequest) -> Single<Data> {
        return self.provider.rx.request(request)
            .asObservable()
            .retry(RepeatBehavior.exponentialDelayed(maxCount: 4, initial: 2.0, multiplier: 1.5))
            .subscribeOn(self.backgroundScheduler)
            .filterSuccessfulStatusAndRedirectCodes()
            .map { $0.data }
            .asSingle()
    }
}
