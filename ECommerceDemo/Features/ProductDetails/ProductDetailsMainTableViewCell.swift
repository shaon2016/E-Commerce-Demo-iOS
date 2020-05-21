//
//  ProductDetailsMainTableViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 21/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class ProductDetailsMainTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewStackView: RatingView!
    
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var relatedProductCollectionView: UICollectionView!
    
     lazy var model = Model()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        relatedProductCollectionView.delegate = self
        relatedProductCollectionView.dataSource = self
    }

    
    func updateView(product : Product) {
        productImage.image = productImage.image
        titleLabel.text = product.title
        priceLabel.text = "\(product.price) BDT"
        reviewStackView.setStarsRating(rating: product.rating)
        reviewLabel.text = "\(product.rating)/5"
    }
  
}


extension ProductDetailsMainTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedProductsCell", for: indexPath) as!
        RelatedProductsCell
        
        cell.updateView(product: model.products[indexPath.row])
        
        return cell
    }
    
    
}
