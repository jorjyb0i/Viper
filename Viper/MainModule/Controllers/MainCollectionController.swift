//
//  ViewController.swift
//  Viper
//
//  Created by jorjyb0i on 08.03.2021.
//

import Foundation
import UIKit

class MainCollectionController: MainControllerBase {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let magicFloat: CGFloat = 8
        let n: CGFloat = 2
        
        let size = floor((view.bounds.width - magicFloat * (n + 1)) / n)
        
        layout.minimumInteritemSpacing = magicFloat
        layout.minimumLineSpacing = magicFloat
        layout.itemSize = CGSize(width: size, height: size / 2)
        layout.sectionInset = .init(top: magicFloat, left: magicFloat, bottom: magicFloat, right: magicFloat)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
        output?.viewLoaded()
    }
}

extension MainCollectionController: MainViewInputProtocol {
    
    func reloadCollection() {
        collectionView.reloadData()
    }
    
    func registerCells(cellConfig: [String : Any]) {
        for (idetifier, cellType) in cellConfig {
            if let cellType = cellType as? UICollectionViewCell.Type {
                collectionView.register(cellType, forCellWithReuseIdentifier: idetifier)
            }
        }
    }
    
    func setViewDelegate(delegate: UICollectionViewDelegate & UITableViewDelegate) {
        collectionView.delegate = delegate
    }
    
    func setViewDataSource(dataSource: UICollectionViewDataSource & UITableViewDataSource) {
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
}

/*
 Генератор данных: объект с заголовком, некое поле (массив таких же объектов), уровень вложенности случайный
 У каждого элемента флаг - bool isCollection случаное значение
 
 Делаем модуль ВАЙПЕРа, должен нарисовать UICollectionView с плитками, где каждая отвечает за такой элемент. А элемент, если флаг трушный, то разворачивается в текущем вью коллекция, иначе скролл. Если есть дочерние, выводит их, иначе своё название.
 
 Каждый элемент будет отображает свё название и количество детей, при нажатии на этот элемент под ним должна развернуться область, в которой будут отображены его дети
 */
