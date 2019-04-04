//
//  AppDelegate.swift
//  Countries
//
//  Created by Vladislav Myakotin on 02/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit
import Dip

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var coordinator: CountriesCoordinator?
    let container = DependencyContainer(configBlock: configureContainer)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        guard let window = self.window else { return true }
        self.coordinator = try? self.container.resolve()
        self.coordinator?.start(on: window)

        return true
    }
}

