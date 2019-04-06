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

/// Responsible for UI navigation and hi-level flow
class CountriesCoordinator {

    // MARK: - Private vars

    private let disposeBag = DisposeBag()
    private var navigationController: UINavigationController?

    // MARK: - Dependencies

    private let countriesService: CountriesService
    private let countryService: CountryService

    // MARK: - Lifecycle

    init(countriesService: CountriesService, countryService: CountryService) {
        self.countriesService = countriesService
        self.countryService = countryService
    }

    // MARK: - Public and internal methods

    func start(on window: UIWindow) {
        guard let viewController = R.storyboard.main.instantiateInitialViewController() else {
            return
        }

        let countryObserver = AnyObserver<CountryCode> { event in
            if case let .next(countryCode) = event {
                self.openCountry(code: countryCode)
            }
        }
        let viewModel = CountriesListViewModelImp(countriesService: countriesService, countryObserver: countryObserver)
        viewController.viewModel = viewModel

        self.navigationController = UINavigationController(rootViewController: viewController)

        window.rootViewController = self.navigationController
    }

    func openCountry(code: CountryCode) {
        guard let viewController = R.storyboard.main.countryViewController() else {
            return
        }
        
        let viewModel = CountryViewModelImp(countryCode: code, countryService: countryService)
        viewController.viewModel = viewModel
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
