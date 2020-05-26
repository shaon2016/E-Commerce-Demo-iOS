//
//  CartTableViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 22/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateView(cart : Cart) {
        let product = cart.product
        
        ivProduct.image = product.image
        titleLabel.text = product.title
        priceLabel.text = "\(product.price) BDT"
        quantityLabel.text = "\(cart.quantity)"
    }
    
    @IBAction func quantityIncrementBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func quantityDecrementBtnTapped(_ sender: UIButton) {
    }
    
}
