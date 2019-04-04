//
//  Country.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Foundation

typealias CountryCode = String

struct Country: Decodable {
    let code: CountryCode
    let name: String
    let population: UInt
    let capitalName: String?
    let neighbours: [String]?
    let currencies: [Currency]?
}
