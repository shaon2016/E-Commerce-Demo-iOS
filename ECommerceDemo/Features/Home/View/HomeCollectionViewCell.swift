//
//  HomeCollectionViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 12/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var sliderImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var featuredProductCollectionView: UICollectionView!
    
    @IBOutlet weak var newArrivalCollectionView: UICollectionView!
    
    @IBOutlet weak var newArrivalCollectionViewHeightConstraint: NSLayoutConstraint!
    
    private  var newArrivalCollectionViewCellHeight  = 190.0
    @IBOutlet weak var pageController: UIPageControl!
    
    private var model : Model?
    
    var goToProductDetailsPage : ((Product) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        featuredProductCollectionView.delegate = self
        featuredProductCollectionView.dataSource = self
        
        newArrivalCollectionView.delegate = self
        newArrivalCollectionView.dataSource = self
        
        
        
    }
    
    func updateView(withModel modelData : Model) {
        model = modelData
        setNewArrivalCollectionViewHeight()
    }
    
    func setNewArrivalCollectionViewHeight() {
        let flowLayout = newArrivalCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let sectionInset = flowLayout.sectionInset.top + flowLayout.sectionInset.bottom
        let count = model?.products.count ?? 0
        var row = 0.0
       
        if count % 2 == 0 {
            row = Double(count / 2 )
        }
        else {
            row = Double(count / 2 ) + 1
        }
        let spaceBetweenLine = flowLayout.minimumLineSpacing * CGFloat(row - 1)
        
        newArrivalCollectionViewHeightConstraint.constant = CGFloat(newArrivalCollectionViewCellHeight * row + Double(spaceBetweenLine + sectionInset) )
    }
}


extension HomeCollectionViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 1:
            return model?.products.count ?? 0
        case 2:
            return model?.products.count ?? 0
        case 3:
            return model?.products.count ?? 0
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
     
      
        switch collectionView.tag {
       
        case 1:
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
           
            if let product = model?.products[indexPath.row] {
                    cell.updateView(product:  product)
            }
            
            return cell
        
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductCell", for: indexPath) as! FeaturedProductCell
          
            if let product = model?.products[indexPath.row] {
                cell.updateView(product:  product)
            }
            
            
            return cell
        
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewArrivalCell", for: indexPath) as! NewArrivalCell
        
            cell.update(product:  model?.products[indexPath.row])
            
            return cell
        
        default:
            
            return UICollectionViewCell()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        switch collectionView.tag {
     
        case 1 :
            
           return CGSize(width: collectionView.frame.width, height: collectionView.bounds.height)
     
        case 2 :
            
            return CGSize(width: 225, height: 145)
            
        case 3:
            
              // Change this column number to get your desired column
                  let column = 2
                  let width = collectionView.bounds.width
                  let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
                  let sectionInset = flowLayout.sectionInset.left + flowLayout.sectionInset.right
                  let spaceBetweenCell = flowLayout.minimumInteritemSpacing * CGFloat((column - 1))
                  // Round down the fraction number using floor method
                  let adjustedWidth =  floor((width - spaceBetweenCell - sectionInset) / CGFloat(column))
                  
                  
                  return CGSize(width: adjustedWidth, height: CGFloat(newArrivalCollectionViewCellHeight))
            
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.bounds.height)
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        if let product = model?.products[indexPath.row] {
        
            goToProductDetailsPage?(product)
        }
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
        if collectionView.tag == 1 {
            pageController.currentPage = indexPath.item
        }
    }
}
