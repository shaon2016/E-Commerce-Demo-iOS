//
//  ViewController.swift
//  ECommerceDemo
//
//  Created by Ashiq  on 10/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    lazy var homeVM = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        setNav()
        
    }
    
    func setNav()  {
        navigationItem.title = "Home"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart"), landscapeImagePhone: .none, style: .plain, target: self, action: #selector(cartBtnTapped))
    }
    
    @objc func cartBtnTapped() {
         let storyboard = UIStoryboard(name: "Cart", bundle: nil)
         let cartVC = storyboard.instantiateViewController(identifier: "CartVC") as! CartVC
                   
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.updateView(withModel : Model())
        
        cell.goToProductDetailsPage = { [weak self] product in
            
            let storyboard = UIStoryboard(name: "ProductDetails", bundle: nil)
            let productDetailsVC = storyboard.instantiateViewController(identifier: "ProductDetailsVC") as! ProductDetailsVC
            
            productDetailsVC.setProduct(product: product)
            self?.navigationController?.pushViewController(productDetailsVC, animated: true)
            //self?.present(productDetailsVC, animated: true, completion: nil)
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let height = collectionView.bounds.height
        
        return CGSize(width: width, height: height)
    }
    
    
}

