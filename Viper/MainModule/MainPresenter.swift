//
//  MainPresenter.swift
//  Viper
//
//  Created by jorjyb0i on 08.03.2021.
//

import Foundation
import UIKit

class MainPresenter: NSObject, MainPresenterInputProtocol {
    
    weak var view: MainViewInputProtocol?
    var interactor: MainInteractorInputProtocol?
    var fabric: MainFabricInputProtocol?
    var router: MainRouterInputProtocol?
    
    var currentObject: TreeObject
    
    init(tree: TreeObject) {
        self.currentObject = tree
        super.init()
    }
    
    //view
    func viewLoaded() {
        view?.setViewDataSource(dataSource: fabric!)
        view?.setViewDelegate(delegate: self)
        
        interactor?.fetchChildren(tree: currentObject)
        
        view?.registerCells(cellConfig: ["tableCell" : UITableViewCell.self,
                                         "collectionCell" : TitledCollectionCell.self
        ])
    }
    
    //interactor
    func didFetchChildren(children: [TreeObject]) {
        if children.count == 0 {
            view?.setChildfreeLabel()
        } else {
            fabric?.createCollectionData(children: children)
        }
    }
    
    //fabric
    func didCreateCollectionData(children: [TreeObject]) {
        view?.reloadCollection()
    }
    
    //router
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToChild(index: indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigateToChild(index: indexPath.row)
    }
    
    func navigateToChild(index: Int) {
        guard currentObject.children.count > index else { return }
        router?.presentMainModule(object: currentObject.children[index])
    }
}
