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
        let code: Driver<String>
        let name: Driver<String>
        let population: Driver<String>
        let capitalName: Driver<String?>
        let neighbours: Driver<String?>
        let currencies: Driver<String?>
    }

    private let country: Country

    var countryCode: String {
        return self.country.code
    }

    init(country: Country) {
        self.country = country
    }

    func transform(input: Input) -> Output {
        let neighbours = self.country.neighbours?.joined(separator: ", ")
        let currencies = self.country.currencies?
                            .compactMap { $0.name }
                            .joined(separator: ", ")

        return Output(code: Driver<String>.just(self.country.code),
                      name: Driver<String>.just(self.country.name),
                      population: Driver<String>.just(String(self.country.population)),
                      capitalName: Driver<String?>.just(self.country.capitalName),
                      neighbours: Driver<String?>.just(neighbours),
                      currencies: Driver<String?>.just(currencies))
    }
}


