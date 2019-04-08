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

    private let modulesFactory: CountriesModuleFactory

    // MARK: - Lifecycle

    init(modulesFactory: CountriesModuleFactory) {
        self.modulesFactory = modulesFactory
    }

    // MARK: - Public and internal methods

    func start(on window: UIWindow) {
        let countryObserver = AnyObserver<CountryCode> { event in
            if case let .next(countryCode) = event {
                self.openCountry(code: countryCode)
            }
        }

        guard let module = self.modulesFactory.countriesListModule(selectionObserver: countryObserver) else {
            return
        }
        self.navigationController = UINavigationController(rootViewController: module.view)

        window.rootViewController = self.navigationController
    }

    func openCountry(code: CountryCode) {
        guard let module = self.modulesFactory.countryModule(code: code) else { return }
        self.navigationController?.pushViewController(module.view, animated: true)
    }
}
