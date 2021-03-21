//
//  AppDelegate.swift
//  Viper
//
//  Created by jorjyb0i on 08.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let navigation = UINavigationController()
        let startingViewController = MainConfigurator.loadModule(object: TreeObject(), navigation: navigation)
        
        navigation.setViewControllers([startingViewController], animated: false)
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}

