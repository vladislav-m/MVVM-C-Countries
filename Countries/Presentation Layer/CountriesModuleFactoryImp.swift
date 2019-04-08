//
//  CountriesModuleFactoryImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 07/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

class CountriesModuleFactoryImp: CountriesModuleFactory {

    private let countriesService: CountriesService
    private let countryService: CountryService

    init(countriesService: CountriesService, countryService: CountryService) {
        self.countriesService = countriesService
        self.countryService = countryService
    }

    func countriesListModule(selectionObserver: AnyObserver<CountryCode>)
        -> Module<CountriesListViewController, CountriesModule>? {
        guard let viewController = R.storyboard.main.instantiateInitialViewController() else {
            return nil
        }
        let viewModel = CountriesListViewModelImp(countriesService: self.countriesService,
                                                  countryObserver: selectionObserver)
        viewController.viewModel = viewModel
        return Module(view: viewController, viewModel: viewModel)
    }

    func countryModule(code: CountryCode) -> Module<CountryViewController, CountryViewModel>? {
        guard let viewController = R.storyboard.main.countryViewController() else {
            return nil
        }

        let viewModel = CountryViewModelImp(countryCode: code, countryService: self.countryService)
        viewController.viewModel = viewModel
        return Module(view: viewController, viewModel: viewModel)
    }
}
