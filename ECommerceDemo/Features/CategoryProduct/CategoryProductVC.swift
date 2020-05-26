//
//  CategoryProductVC.swift
//  ECommerceDemo
//
//  Created by Ashiq on 25/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit
import DropDown
import SideMenu


class CategoryProductVC: UIViewController {
    
    // MARK:- Variable
    @IBOutlet weak var categoryProductCollectionView: UICollectionView!
    
    @IBOutlet weak var dropDownBtn: UIButton!
    @IBOutlet weak var gridViewBtn: UIImageView!
    @IBOutlet weak var filterBtn: UIImageView!
    private lazy var dropDown = DropDown()
    
    private var cell : CategoryProductCell?
    private lazy var isToShowInGridView = false
    
    private lazy var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
        
        setDropDown()
    }
    
    func setNav()  {
        navigationItem.title = "Products"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart"), landscapeImagePhone: .none, style: .plain, target: self, action: #selector(cartBtnTapped))
    }
    
    @objc func cartBtnTapped() {
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let cartVC = storyboard.instantiateViewController(identifier: "CartVC") as! CartVC
        
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
    func setDropDown() {
        
        dropDown.anchorView = dropDownBtn
        
        dropDown.dataSource = ["Low Price", "High Price", "Free"]
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            
            self.dropDownBtn.setTitle(item, for: .normal)
        }
    }
    
    @IBAction func dropDownBtnTapped(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func filterBtnTapped(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "RightSideFilterMenuViewController") else { return  }
        
        let menu = SideMenuNavigationController(rootViewController: vc)
        present(menu, animated: true, completion: nil)
        
    }
    
    
    @IBAction func gridBtnTapped(_ sender: Any) {
        
        
        
        if isToShowInGridView {
            
            isToShowInGridView = false
            
        } else {
            isToShowInGridView = true
            
        }
        
        
        categoryProductCollectionView.reloadData()
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let title = model.products[indexPath.row].title
        
        let imageHeight : CGFloat = 220.0
        let ratingViewHeight : CGFloat = 14.0
        let titleHeight = title.size(withAttributes:[.font: UIFont.systemFont(ofSize:16.0)]).height
        
        
        let priceHeight : CGFloat = 21.5
        
        let previousPriceHeight : CGFloat = 18.0
        
        let totalHeight = imageHeight + titleHeight + priceHeight + previousPriceHeight + ratingViewHeight + 35
        
        let width = view.frame.width
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let sectionInset = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        
        if !isToShowInGridView {
            let column = 2
            let spaceBetweenCell = 10 * CGFloat((column - 1))
            // Round down the fraction number using floor method
            
            let adjustedWidth =  floor((width - spaceBetweenCell - sectionInset) / CGFloat(column))
            
            return CGSize(width: adjustedWidth, height: totalHeight)
        }else {
            let column = 1
            let spaceBetweenCell = 10 * CGFloat((column - 1))
            // Round down the fraction number using floor method
            
            let adjustedWidth =  floor((width - spaceBetweenCell - sectionInset) / CGFloat(column))
            return CGSize(width: adjustedWidth, height: totalHeight)
        }
    }
    
}
