//
//  CountryService.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

/// Describes servise, providing access to detailed country info
protocol CountryService {
    /// Fetch detailed country info
    ///
    /// - Parameter code: ISO code of country, wich detailed info needs to be fetched
    /// - Returns: Stream wich emits Country instance by subscription on it. May emit errors
    func fetchCountry(code: String) -> Single<Country>
}
