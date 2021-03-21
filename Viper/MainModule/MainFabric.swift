//
//  MainFabric.swift
//  Viper
//
//  Created by jorjyb0i on 08.03.2021.
//

import Foundation
import UIKit

class MainFabric: NSObject, MainFabricInputProtocol {
    
    weak var output: MainFabricOutputProtocol?
    var currentObjects: [TreeObject]?
    let tableCell = "tableCell"
    let collectionCell = "collectionCell"

    func createCollectionData(children: [TreeObject]) {
        currentObjects = children
        output?.didCreateCollectionData(children: children)
    }
    
    //- MARK: Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCell, for: indexPath)
        cell.textLabel?.text = currentObjects?[indexPath.row].title
        return cell
    }
    
    // -MARK: Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath)
        if let cell = cell as? TitledCollectionCell {
            cell.mLabelTitle.text = currentObjects?[indexPath.row].title
            cell.contentView.backgroundColor = .clear
            cell.backgroundColor = .clear
        }
        return cell
    }
}

