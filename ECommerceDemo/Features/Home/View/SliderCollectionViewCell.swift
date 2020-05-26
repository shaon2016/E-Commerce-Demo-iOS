//
//  SliderCollectionViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 12/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell{
    
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    
    
    func updateView(product : Product) {
        image.image = product.image
        
    }
    
    
    
    
}
