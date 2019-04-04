//
//  CountryServiceImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

class CountryServiceImp: CountryService {

    // MARK: - Private vars

    private let api: APIComponent
    private let backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated)

    // MARK: - Lifecycle

    init(api: APIComponent) {
        self.api = api
    }

    // MARK: - CountryService

    func fetchCountry(code: String) -> Single<Country> {
        return self.api.getData(for: .country(code: code))
            .observeOn(self.backgroundScheduler)
            .map { try JSONDecoder().decode(Country.self, from: $0) }
    }
}
