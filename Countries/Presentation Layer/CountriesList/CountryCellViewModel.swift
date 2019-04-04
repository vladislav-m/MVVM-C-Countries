//
//  CountryCellViewModel.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift
import RxCocoa

class CountryCellViewModel {
    struct Input {}

    struct Output {
        let name: Driver<String>
        let population: Driver<String>
    }

    private let country: Country

    var countryCode: String {
        return self.country.code
    }

    init(country: Country) {
        self.country = country
    }

    func transform(input: Input) -> Output {

        return Output(name: Driver<String>.just(self.country.name),
                      population: Driver<String>.just(String(self.country.population)))
    }
}


