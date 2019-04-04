//
//  CountriesListViewModel.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxCocoa

/// Input streams for countries list screen
struct CountriesInput {
    /// Emits selected country viewModel, whenever user tapped on country cell
    let countrySelected: Driver<CountryCellViewModel>
    /// Emits when user performed pull-to-refresh gesture
    let refresh: Driver<Void>
}

/// Output streams for countries list screen
struct CountriesOutput {
    /// Emits list of viewModels for each country
    let countriesList: Driver<[CountryCellViewModel]>
    /// Indicates whether API request for list of countries is currentrly performing or not
    let isLoading: Driver<Bool>
    /// Emits any errors, occured during fetching countries list
    let errors: Driver<Error>
}

/// Describes ViewModel for list of countries screen
protocol CountriesListViewModel {
    /// Transforms input streams into output streams
    ///
    /// - Parameter input: Input streams
    /// - Returns: Output streams
    func transform(input: CountriesInput) -> CountriesOutput
}
