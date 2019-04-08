//
//  CountriesModuleFactory.swift
//  Countries
//
//  Created by Vladislav Myakotin on 07/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Foundation
import RxSwift

protocol CountriesModuleFactory {
    func countriesListModule(selectionObserver: AnyObserver<CountryCode>)
        -> Module<CountriesListViewController, CountriesModule>?
    func countryModule(code: CountryCode) -> Module<CountryViewController, CountryViewModel>?
}
