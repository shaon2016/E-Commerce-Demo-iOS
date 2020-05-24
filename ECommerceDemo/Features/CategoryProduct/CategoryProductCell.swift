//
//  CategoryProductCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 25/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class CategoryProductCell: UICollectionViewCell {
    
    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var previousPrice: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        //widthConstraint.constant = 5
        
        
        calculateCellWidth()
    }
    
    
    
    func calculateCellWidth() {
        let column = 2
        let width = UIScreen.main.bounds.width
        
        let sectionInset = CGFloat( 8 + 8) // (left = 8 and right = 8)
        let spaceBetweenCell = 10 * CGFloat((column - 1))
        // Round down the fraction number using floor method
        // -32 is the collection view margin (left + right)
        let adjustedWidth =  floor((width - spaceBetweenCell - sectionInset) / CGFloat(column))
        
        widthConstraint.constant = adjustedWidth
    }
    
    func updateView(product : Product) {
        ivProduct.image = product.image
        titleLabel.text = product.title
        priceLabel.text = "\(product.price) BDT"
        previousPrice.text = "\(product.price + 50) BDT"
        ratingView.setStarsRating(rating: product.rating)
    }
    
}
