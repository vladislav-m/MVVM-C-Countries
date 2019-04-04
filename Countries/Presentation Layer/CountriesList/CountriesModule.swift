//
//  CountriesModule.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

protocol CountriesModule {
    var countryObserver: AnyObserver<CountryCode> { get }
}
