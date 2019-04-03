//
//  CountriesService.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

protocol CountriesService {
    func countries() -> Single<[Country]>
}
