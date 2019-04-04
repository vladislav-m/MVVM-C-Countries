//
//  Dependencies.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Dip
import Moya

func configureContainer(rootContainer: DependencyContainer) {
    rootContainer.register(.singleton) {
        APIComponentImp(provider: MoyaProvider<APIRequest>()) as APIComponent
    }
    rootContainer.register(.singleton) {
        CountriesServiceImp(api: $0) as CountriesService
    }
    rootContainer.register(.singleton) {
        CountryServiceImp(api: $0) as CountryService
    }

    rootContainer.register(.unique) {
        CountriesCoordinator(countriesService: $0, countryService: $1)
    }
}
