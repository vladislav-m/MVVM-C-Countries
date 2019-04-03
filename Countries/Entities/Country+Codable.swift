//
//  Country+Codable.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Foundation

extension Country {
    enum CodingKeys: String, CodingKey {
        case code = "alpha3Code"
        case name
        case population
        case capitalName = "capital"
        case neighbours = "borders"
        case currencies
    }
}
