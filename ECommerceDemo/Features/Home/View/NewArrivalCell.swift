//
//  NewArrivalCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 12/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class NewArrivalCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var starView: RatingView!
    
    func update(product : Product?) {
        image.image = product?.image
        titleLabel.text = product?.title
        priceLabel.text = "\(product?.price ?? 0.0) BDT"
        starView.setStarsRating(rating: product?.rating ?? 0)
    }
}
