//
//  CountryViewModelImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt

class CountryViewModelImp: CountryViewModel {

    // MARK: - Private vars
    
    private let countryService: CountryService
    private let disposeBag = DisposeBag()

    // MARK: - CountryViewModel

    var name: Driver<String>
    var population: Driver<String>
    var capitalName: Driver<String?>
    var neighbours: Driver<String?>
    var currencies: Driver<String?>
    var isLoading: Driver<Bool>
    var errors: Driver<Error>

    // MARK: - Lifecycle

    init(countryCode: CountryCode, countryService: CountryService) {
        self.countryService = countryService
        let defaultCountry = Country(code: "",
                                     name: "",
                                     population: 0,
                                     capitalName: nil,
                                     neighbours: nil,
                                     currencies: nil)
        let request = countryService.fetchCountry(code: countryCode)
            .asObservable()
            .materialize()
            .share()
        self.name = request.elements()
            .map { $0.name }
            .asDriver(onErrorJustReturn: defaultCountry.name)
        self.population = request.elements()
            .map { String($0.population) }
            .asDriver(onErrorJustReturn: String(defaultCountry.population))
        self.capitalName = request.elements()
            .map { $0.capitalName }
            .asDriver(onErrorJustReturn: nil)

        self.neighbours = request.elements()
            .map { $0.neighbours?.joined(separator: ", ") }
            .asDriver(onErrorJustReturn: nil)
        self.currencies = request.elements()
            .map {
                $0.currencies?
                    .compactMap { $0.name }
                    .joined(separator: ", ")
            }
            .asDriver(onErrorJustReturn: nil)

        self.isLoading = request.map { _ in false }
            .asObservable()
            .startWith(true)
            .asDriver(onErrorJustReturn: false)

        self.errors = request.errors()
                        .asDriver(onErrorJustReturn: NSError(domain: "", code: 0, userInfo: nil))
    }

}
