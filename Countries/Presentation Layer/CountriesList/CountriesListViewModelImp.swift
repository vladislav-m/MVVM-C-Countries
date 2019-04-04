//
//  CountriesListViewModelImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt

class CountriesListViewModelImp: CountriesListViewModel, CountriesModule {
    
    private let countriesService: CountriesService
    private let disposeBag = DisposeBag()

    var countryObserver: AnyObserver<CountryCode>

    init(countriesService: CountriesService, countryObserver: AnyObserver<CountryCode>) {
        self.countriesService = countriesService
        self.countryObserver = countryObserver
    }

    func transform(input: CountriesInput) -> CountriesOutput {
        input.countrySelected.map { $0.countryCode }
            .drive(self.countryObserver)
            .disposed(by: self.disposeBag)

        let countries = input.refresh
            .asObservable()
            .startWith(())
            .flatMap {
                self.countriesService.countries().map {
                    $0.map { CountryCellViewModel(country: $0) }
                }.asObservable().materialize()
            }.share()

        let isLoading = countries.map { _ in false }
                            .asObservable()
                            .startWith(true)
                            .asDriver(onErrorJustReturn: false)

        let errors = countries.errors()
                        .asDriver(onErrorJustReturn: NSError(domain: "", code: 0, userInfo: nil))


        return CountriesOutput(countriesList: countries.elements().asDriver(onErrorJustReturn: []),
                               isLoading: isLoading,
                               errors: errors)
    }
}
