//
//  Currency.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import Foundation

struct Currency: Codable {
    // since we have inconsistent api responses for currencies(sometimes they missed name, sometimes code)
    // we had to make all fields optional, to avoid ruining all the response mapping due to 4-5 inconsistent
    // currencies. In a real world production api this would be concern of API developers, but here we should
    // include some flexibility on client side
    let code: String?
    let name: String?
    let symbol: String?
}

