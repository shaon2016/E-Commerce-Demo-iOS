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
    
    private  var relatedProductCollectionViewCellHeight  = 216.0
    @IBOutlet weak var relatedProductCollectionViewHeightConstraint: NSLayoutConstraint!
    
    
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
        
        setrelatedProductCollectionViewHeight()
    }
    


  
}


extension ProductDetailsMainTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedProductsCell", for: indexPath) as!
        RelatedProductsCell
        
        cell.updateView(product: model.products[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Change this column number to get your desired column
        let column = 2
        let width = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let sectionInset = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let spaceBetweenCell = flowLayout.minimumInteritemSpacing * CGFloat((column - 1))
        // Round down the fraction number using floor method
        let adjustedWidth =  floor((width - spaceBetweenCell - sectionInset) / CGFloat(column))
        
        
        return CGSize(width: adjustedWidth, height: CGFloat(relatedProductCollectionViewCellHeight))
    }
    
    func setrelatedProductCollectionViewHeight() {
        let flowLayout = relatedProductCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let sectionInset = flowLayout.sectionInset.top + flowLayout.sectionInset.bottom
        let count = model.products.count
        var row = 0.0
       
        if count % 2 == 0 {
            row = Double(count / 2 )
        }
        else {
            row = Double(count / 2 ) + 1
        }
        let spaceBetweenLine = flowLayout.minimumLineSpacing * CGFloat(row - 1)
        
        relatedProductCollectionViewHeightConstraint.constant = CGFloat(relatedProductCollectionViewCellHeight * row + Double(spaceBetweenLine + sectionInset) )
    }
}
