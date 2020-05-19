//
//  SliderCollectionViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 12/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageWIdthConstraint: NSLayoutConstraint!
    
   
     func updateView(product : Product) {
         image.image = product.image
        
        imageWIdthConstraint.constant = bounds.width
        imageHeightConstraint.constant = bounds.height
     }
}
