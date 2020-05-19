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
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 1
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
          cell.updateView(withModel : Model())
        
            return cell
       }
       

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let height = collectionView.bounds.height
     
        return CGSize(width: width, height: height)
    }
    
    
}

