//
//  TitledCollectionCell.swift
//  Viper
//
//  Created by jorjyb0i on 16.03.2021.
//

import Foundation
import UIKit

class TitledCollectionCell: UICollectionViewCell {
    
    let mLabelTitle: UILabel
    let gradient: CAGradientLayer
    
    override init(frame: CGRect) {
        
        mLabelTitle = UILabel()
        gradient = CAGradientLayer()
        
        super.init(frame: frame)
        
        gradient.layoutSublayers()
        gradient.colors = [UIColor.lightGray.cgColor, UIColor.white.cgColor]
        gradient.startPoint = .init(x: 0, y: 0)
        gradient.endPoint = .init(x: 1, y: 1)
        gradient.opacity = 0.7
        
        self.contentView.layer.addSublayer(gradient)
        
//        mLabelTitle.textColor = .black
        mLabelTitle.numberOfLines = 3
        mLabelTitle.lineBreakMode = .byCharWrapping
        
        mLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mLabelTitle)
        
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            mLabelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            mLabelTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            mLabelTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            mLabelTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -4)
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = self.contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
