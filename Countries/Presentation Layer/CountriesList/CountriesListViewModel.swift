//
//  CountriesListViewModel.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt

class CountriesListViewModel: ViewModel {

    struct Input {
        let countrySelected: Driver<CountryCellViewModel>
    }

    struct Output {
        let countriesList: Driver<[CountryCellViewModel]>
        let isLoading: Driver<Bool>
        let errors: Driver<Error>
    }

    private let countriesService: CountriesService

    private let disposeBag = DisposeBag()

    init(countriesService: CountriesService) {
        self.countriesService = countriesService
    }

    func transform(input: Input) -> Output {
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


        return Output(countriesList: countries.asDriver(onErrorJustReturn: []),
                      isLoading: isLoading,
                      errors: errors)
    }
}
