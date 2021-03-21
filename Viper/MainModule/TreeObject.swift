//
//  TreeObject.swift
//  Viper
//
//  Created by jorjyb0i on 16.03.2021.
//

import Foundation

class TreeObject {
    
    lazy var children: [TreeObject] = createChildren()
    let title: String = UUID().uuidString
    let isCollection: Bool = Bool.random()
    
    private func createChildren() -> [TreeObject] {
        var newArray: [TreeObject] = []
        
        let numberOfElements = Int.random(in: 0...4)
        
        if numberOfElements != 0 {
            for _ in 0..<numberOfElements {
                newArray.append(TreeObject())
            }
        }
        return newArray
    }
}
