//
//  MainTableView.swift
//  Viper
//
//  Created by jorjyb0i on 12.03.2021.
//

import Foundation
import UIKit

class MainTableController: UIViewController {
    
    var output: MainViewOutputProtocol?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        output?.viewLoaded()
    }
}

extension MainTableController: MainViewInputProtocol {
    
    func registerCells(cellConfig: [String : Any]) {
        for (identifier, cellType) in cellConfig {
            if let cellType = cellType as? UITableViewCell.Type {
                tableView.register(cellType, forCellReuseIdentifier: identifier)
            }
        }
    }
    
    func reloadCollection() {
        tableView.reloadData()
    }
    
    func setViewDelegate(delegate: UICollectionViewDelegate & UITableViewDelegate) {
        tableView.delegate = delegate
    }
    
    func setViewDataSource(dataSource: UICollectionViewDataSource & UITableViewDataSource) {
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
