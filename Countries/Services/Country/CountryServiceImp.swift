//
//  CountryServiceImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

class CountryServiceImp: CountryService {

    private let api: APIComponent
    private let backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated)

    init(api: APIComponent) {
        self.api = api
    }

    func fetchCountry(code: String) -> Single<Country> {
        return self.api.getData(for: .country(code: code))
            .observeOn(self.backgroundScheduler)
            .map { try JSONDecoder().decode(Country.self, from: $0) }
    }
}
