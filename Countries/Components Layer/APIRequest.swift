//
//  APIRequest.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Foundation

/// List of available methods of API with parameters
///
/// - countriesList: fetches list of all countries from '/all' method
/// - country: fetches info for single country with given ISO code
enum APIRequest {
    case countriesList
    case country(code: String)
}
