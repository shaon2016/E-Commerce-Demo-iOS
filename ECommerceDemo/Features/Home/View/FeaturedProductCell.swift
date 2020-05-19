//
//  FeaturedProductCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 12/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class FeaturedProductCell: UICollectionViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func updateView(product : Product) {
        imageOutlet.image = product.image
        titleLabel.text = product.title
        priceLabel.text = "\(product.price) BDT"
    }
}
