//
//  SubCategoryTableViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 23/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class SubCategoryTableViewCell: UITableViewCell {
    // MARK:- Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productTypeCollectionView: UICollectionView!
    
    @IBOutlet weak var productTypeCollectionViewHeightConstant: NSLayoutConstraint!
    private  var productTypeCollectionViewCellHeight  = 30
    
    private var subCategory : Subcategory?
    
    var productTypeTapped : (() -> Void)?
    
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
        
        //setproductTypeCollectionViewHeight()
        
        //        productTypeCollectionViewHeightConstant.constant = 150
        
        
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
        
        if let type = subCategory?.productTypes[indexPath.row] {
            let text = type.title
            let cellWidth = text.size(withAttributes:[.font: UIFont.systemFont(ofSize:13.0)]).width + 30.0
            return CGSize(width: cellWidth, height: 30.0)
        } else {
            return CGSize(width: 0.0, height: 0.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productTypeTapped?()
    }
    
}
