//
//  Country.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Foundation

struct Country {
    let code: String
    let name: String
    let population: UInt
    let capitalName: String?
    let neighbours: [Country]?
    let currencyCodes: [String]?
}
