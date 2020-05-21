//
//  RelatedProductsCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 21/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class RelatedProductsCell: UICollectionViewCell {
    
    @IBOutlet weak var ivOutlet: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var reviewStackView: RatingView!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    func updateView(product : Product) {
        ivOutlet.image = product.image
        titleLabel.text = product.title
        priceLabel.text = "\(product.price) BDT"
        reviewStackView.setStarsRating(rating: product.rating)
        reviewLabel.text = "\(product.rating)/5"
    }
    
    
}


