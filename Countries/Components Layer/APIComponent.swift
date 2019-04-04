//
//  APIComponent.swift
//  Countries
//
//  Created by Vladislav Myakotin on 03/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import RxSwift

/// Describes component, that provides access to backend API
protocol APIComponent {
    /// Fetch data from api for given request
    ///
    /// - Parameter request: request describes API call
    /// - Returns: Single, that emits fetched data, or error
    func getData(for request: APIRequest) -> Single<Data>
}
