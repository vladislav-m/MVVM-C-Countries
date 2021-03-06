//
//  Currency.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Foundation

/// Describing currency details
///
/// Note: since we have inconsistent api responses for currencies(sometimes they missed name, sometimes code)
/// we had to make all fields optional, to avoid ruining all the response mapping due to 4-5 inconsistent
/// currencies. In a real world production api this would be concern of API developers, but here we should
/// include some flexibility on client side
struct Currency: Codable {
    /// ISO currency code
    let code: String?
    /// General currency name
    let name: String?
    /// Special symbol for given currency
    let symbol: String?
}

