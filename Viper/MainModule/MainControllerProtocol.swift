//
//  MainControllerProtocol.swift
//  Viper
//
//  Created by jorjyb0i on 08.03.2021.
//

import Foundation
import UIKit

//presenter
protocol MainPresenterInputProtocol: NSObject, MainViewOutputProtocol, MainInteractorOutputProtocol, MainRouterOutputProtocol, MainFabricOutputProtocol, UITableViewDelegate, UICollectionViewDelegate {
    
}

//view
protocol MainViewInputProtocol: class {
    func setViewDelegate(delegate: UITableViewDelegate & UICollectionViewDelegate)
    func setViewDataSource(dataSource: UITableViewDataSource & UICollectionViewDataSource)
    func setChildfreeLabel()
    
    func reloadCollection()
    func registerCells(cellConfig: [String : Any])
}

protocol MainViewOutputProtocol: class {
    func viewLoaded()
}

//interactor
protocol MainInteractorInputProtocol: class {
    func fetchChildren(tree: TreeObject)
}

protocol MainInteractorOutputProtocol: class {
    func didFetchChildren(children: [TreeObject])
}

//fabric
protocol MainFabricInputProtocol: NSObject, UITableViewDataSource, UICollectionViewDataSource {
    func createCollectionData(children: [TreeObject])
}

protocol MainFabricOutputProtocol: class {
    func didCreateCollectionData(children: [TreeObject])
}

//router
protocol MainRouterInputProtocol: class {
    func presentMainModule(object: TreeObject)
}

protocol MainRouterOutputProtocol: class {
    
}
