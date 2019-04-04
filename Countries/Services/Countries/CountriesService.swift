//
//  CountriesService.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

/// Describes servise, providing access to country list data
protocol CountriesService {
    /// Fetch list of all countries
    ///
    /// - Returns: Stream wich emits list of all countries by subscription on it. May emit errors
    func countries() -> Single<[Country]>
}
