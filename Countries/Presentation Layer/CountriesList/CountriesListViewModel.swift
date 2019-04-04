//
//  CountriesListViewModel.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxCocoa

struct CountriesInput {
    let countrySelected: Driver<CountryCellViewModel>
    let refresh: Driver<Void>
}

struct CountriesOutput {
    let countriesList: Driver<[CountryCellViewModel]>
    let isLoading: Driver<Bool>
    let errors: Driver<Error>
}

protocol CountriesListViewModel {
    func transform(input: CountriesInput) -> CountriesOutput
}
