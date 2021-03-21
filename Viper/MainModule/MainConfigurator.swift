//
//  MainConfigurator.swift
//  Viper
//
//  Created by jorjyb0i on 08.03.2021.
//

import Foundation
import UIKit

class MainConfigurator {
    
    static func loadModule(object: TreeObject, navigation: UINavigationController? = nil) -> UIViewController {
  
        var view: (MainControllerBase & MainViewInputProtocol)?
        
        if object.isCollection {
            view = MainCollectionController()
        } else {
            view = MainTableController()
        }
        
        view?.navigationItem.title = object.title
        
        let presenter = MainPresenter(tree: object)
        let interactor = MainInteractor()
        let router = MainRouter()
        let fabric = MainFabric()
        
        presenter.fabric = fabric
        fabric.output = presenter
        
        presenter.interactor = interactor
        interactor.output = presenter
        
        presenter.view = view
        view?.output = presenter
        
        presenter.router = router
        router.output = presenter
        router.presentator = view
        router.navigator = navigation
        
        return view!
    }
}
