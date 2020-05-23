//
//  SubCategoryTableViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 23/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class SubCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productTypeCollectionView: UICollectionView!
    
    @IBOutlet weak var productTypeCollectionViewHeightConstant: NSLayoutConstraint!
    private  var productTypeCollectionViewCellHeight  = 30
    
    private var subCategory : Subcategory?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productTypeCollectionView.delegate = self
        productTypeCollectionView.dataSource = self
    }

    func updateView(subcategory : Subcategory) {
//        productTypeCollectionView.numberOfItems(inSection: subcategory.productTypes.count)
        
        self.subCategory = subcategory
        productTypeCollectionView.reloadData()
 
        titleLabel.text = subcategory.title
        
        setproductTypeCollectionViewHeight()
    }

    func setproductTypeCollectionViewHeight() {
        let flowLayout = productTypeCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
               let sectionInset = flowLayout.sectionInset.top + flowLayout.sectionInset.bottom
               let count = subCategory?.productTypes.count ?? 0
               var row = 0.0
              
               if count % 2 == 0 {
                   row = Double(count / 2 )
               }
               else {
                   row = Double(count / 2 ) + 1
               }
               let spaceBetweenLine = flowLayout.minimumLineSpacing * CGFloat(row - 1)
               
               productTypeCollectionViewHeightConstant.constant = CGFloat(Double(productTypeCollectionViewCellHeight) * row + Double(spaceBetweenLine + sectionInset) )
    }
}

extension SubCategoryTableViewCell : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategory?.productTypes.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductTypeCollectionViewCell", for: indexPath) as! ProductTypeCollectionViewCell
        
        if let type = subCategory?.productTypes[indexPath.row] {
            cell.updateView(type: type )
            
            
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: CGFloat(productTypeCollectionViewCellHeight))
    }
}
