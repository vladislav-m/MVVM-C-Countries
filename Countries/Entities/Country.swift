//
//  Country.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Foundation

typealias CountryCode = String

/// Describes country data
struct Country: Decodable {
    /// 3 symbols ISO country code
    let code: CountryCode
    /// General name of country
    let name: String
    /// Number of people, living in country
    let population: UInt
    /// Name of country capital
    let capitalName: String?
    /// ISO country codes of countries, that have common borders with given country
    let neighbours: [String]?
    /// List of official currencies, allowed in country
    let currencies: [Currency]?
}
