//
//  ChildFreeController.swift
//  Viper
//
//  Created by jorjyb0i on 17.03.2021.
//

import Foundation
import UIKit

class MainControllerBase: UIViewController {
    
    var output: MainViewOutputProtocol?
    lazy var childfreeLabel = UILabel()
    
    func setChildfreeLabel() {
        
        view.addSubview(childfreeLabel)
        childfreeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        childfreeLabel.text = "Childfree"
        childfreeLabel.textColor = .black
        childfreeLabel.font = UIFont.boldSystemFont(ofSize: 40)
        NSLayoutConstraint.activate([
            childfreeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            childfreeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        childfreeLabel.textAlignment = .center
        view.backgroundColor = .white
    }
}
