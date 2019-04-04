//
//  CountryViewModelImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift
import RxCocoa

class CountryViewModelImp: CountryViewModel {
    
    private let countryService: CountryService
    private let disposeBag = DisposeBag()

    var code: Driver<String>
    var name: Driver<String>
    var population: Driver<String>
    var capitalName: Driver<String?>
    var neighbours: Driver<String?>
    var currencies: Driver<String?>

    init(countryCode: CountryCode, countryService: CountryService) {
        self.countryService = countryService
        let defaultCountry = Country(code: "",
                                     name: "",
                                     population: 0,
                                     capitalName: nil,
                                     neighbours: nil,
                                     currencies: nil)
        let request = countryService.fetchCountry(code: countryCode).asDriver(onErrorJustReturn: defaultCountry)
        self.code = request.map { $0.code }
        self.name = request.map { $0.name }
        self.population = request.map { $0.code }
        self.capitalName = request.map { $0.capitalName }

        self.neighbours = request.map { $0.neighbours?.joined(separator: ", ") }
        self.currencies = request.map {
            $0.currencies?
            .compactMap { $0.name }
            .joined(separator: ", ")
        }
    }
}
