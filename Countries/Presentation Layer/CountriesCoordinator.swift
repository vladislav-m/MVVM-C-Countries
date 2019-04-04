//
//  CountriesCoordinator.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class CountriesCoordinator {
    private let window: UIWindow
    private let disposeBag = DisposeBag()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        guard let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
            as? CountriesListViewController  else {
                return
        }

        let api = APIComponentImp(provider: MoyaProvider<APIRequest>())
        let countriesService = CountriesServiceImp(api: api)
        let countryObserver = AnyObserver<CountryCode> { event in
            if case let .next(countryCode) = event {
                self.openCountry(code: countryCode)
            }
        }
        let viewModel = CountriesListViewModelImp(countriesService: countriesService, countryObserver: countryObserver)
        viewController.viewModel = viewModel


        self.window.rootViewController = viewController
    }

    func openCountry(code: CountryCode) {
        
    }
}
