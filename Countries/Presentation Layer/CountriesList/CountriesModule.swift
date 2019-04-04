//
//  CountriesModule.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

/// Protocol for interactions between countries list screen and coordinator
protocol CountriesModule {
    /// Observer which will receive event, when some country selected on countries list screen
    var countryObserver: AnyObserver<CountryCode> { get }
}
