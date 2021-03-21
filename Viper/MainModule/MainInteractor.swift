//
//  MainInteractor.swift
//  Viper
//
//  Created by jorjyb0i on 08.03.2021.
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {
    
    weak var output: MainInteractorOutputProtocol?

    func fetchChildren(tree: TreeObject) {
        output?.didFetchChildren(children: tree.children)
    }
}

//контроллер предоставляет залупу, натягивает ТВ, описывает протоколы, позволяющие объекту запихать в него инфу. 
