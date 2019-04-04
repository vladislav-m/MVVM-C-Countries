//
//  CountryViewModel.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxCocoa

protocol CountryViewModel {
    var code: Driver<String> { get }
    var name: Driver<String> { get }
    var population: Driver<String> { get }
    var capitalName: Driver<String?> { get }
    var neighbours: Driver<String?> { get }
    var currencies: Driver<String?> { get }
    var isLoading: Driver<Bool> { get }
    var errors: Driver<Error> { get }
}
