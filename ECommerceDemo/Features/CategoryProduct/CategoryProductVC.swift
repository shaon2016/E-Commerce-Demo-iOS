//
//  CategoryProductVC.swift
//  ECommerceDemo
//
//  Created by Ashiq on 25/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class CategoryProductVC: UIViewController {

    // MARK:- Variable
    @IBOutlet weak var categoryProductCollectionView: UICollectionView!
    
    private lazy var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    


}

// MARK:- collection view data source and delegate
extension CategoryProductVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryProductCell", for: indexPath) as! CategoryProductCell
        
        cell.updateView(product: model.products[indexPath.row])
        
        return cell
    }
    
}
