//
//  CountryCellViewModel.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift
import RxCocoa

/// ViewModel for country cell
class CountryCellViewModel {

    /// Input streams for country cell
    struct Input {}
    /// Output streams for country cell
    struct Output {
        /// Emits name of country
        let name: Driver<String>
        /// Emits country population, converted to string
        let population: Driver<String>
    }

    // MARK: - Private vars

    private let country: Country

    // MARK: - Public and internal vars

    var countryCode: String {
        return self.country.code
    }

    // MARK: - Lifecycle

    init(country: Country) {
        self.country = country
    }

    // MARK: - Public and internal methods

    func transform(input: Input) -> Output {
        return Output(name: Driver<String>.just(self.country.name),
                      population: Driver<String>.just(String(self.country.population)))
    }
}


