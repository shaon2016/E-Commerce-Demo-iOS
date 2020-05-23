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
    
    
    func updateView(type : ProductType) {
        titleLabel.text = type.title
    }
}
