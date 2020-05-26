//
//  ProductTypeCollectionViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 23/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class ProductTypeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleLabelWidthConstraint: NSLayoutConstraint!
    
    func updateView(type : ProductType) {
        titleLabel.text = type.title
        
       
        
        self.layer.cornerRadius = 3.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
    }
}
