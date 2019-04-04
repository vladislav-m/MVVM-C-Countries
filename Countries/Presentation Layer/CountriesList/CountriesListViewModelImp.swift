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

class CountriesListViewModelImp: CountriesListViewModel {
    
    private let countriesService: CountriesService
    private let disposeBag = DisposeBag()

    init(countriesService: CountriesService) {
        self.countriesService = countriesService
    }

    func transform(input: CountriesInput) -> CountriesOutput {
        input.countrySelected.asObservable().subscribe(onNext: { countryCellViewModel in

        }).disposed(by: self.disposeBag)

        let countries = self.countriesService.countries().map {
            $0.map { CountryCellViewModel(country: $0) }
        }

        let isLoading = countries.map { _ in false }
                            .asObservable()
                            .startWith(false)
                            .asDriver(onErrorJustReturn: false)

        let errors = countries.asObservable()
                        .materialize()
                        .errors()
                        .asDriver(onErrorJustReturn: NSError(domain: "", code: 0, userInfo: nil))


        return CountriesOutput(countriesList: countries.asDriver(onErrorJustReturn: []),
                               isLoading: isLoading,
                               errors: errors)
    }
}
