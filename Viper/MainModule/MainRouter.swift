//
//  MainRouter.swift
//  Viper
//
//  Created by jorjyb0i on 08.03.2021.
//

import Foundation
import UIKit

class MainRouter: MainRouterInputProtocol {
    
    weak var output: MainRouterOutputProtocol?
    weak var presentator: UIViewController?
    weak var navigator: UINavigationController?
    
    func presentMainModule(object: TreeObject) {
        let newModule = MainConfigurator.loadModule(object: object, navigation: navigator)
        navigator?.pushViewController(newModule, animated: true)
    }
}
