//
//  CountriesServiceImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

class CountriesServiceImp: CountriesService {

    private let api: APIComponent

    init(api: APIComponent) {
        self.api = api
    }

    func countries() -> Single<[Country]> {
        return self.api.getData(for: .countriesList)
            .map { try JSONDecoder().decode([Country].self, from: $0) }
    }
}
