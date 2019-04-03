//
//  CountryServiceImp.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

class CountryServiceImp: CountryService {
    func fetchCountry(code: String) -> Single<Country> {
        let country = Country(code: "", name: "", population: 0, capitalName: nil, neighbours: nil, currencyCodes: nil)
        return Observable<Country>.just(country).asSingle()
    }
}
