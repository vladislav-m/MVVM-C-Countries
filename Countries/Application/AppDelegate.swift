//
//  AppDelegate.swift
//  Countries
//
//  Created by Vladislav Myakotin on 02/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var coordinator: CountriesCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        guard let window = self.window else { return true }
        self.coordinator = CountriesCoordinator(window: window)
        self.coordinator?.start()

        return true
    }
}

