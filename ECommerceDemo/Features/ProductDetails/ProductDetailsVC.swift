//
//  ProductVC.swift
//  ECommerceDemo
//
//  Created by Ashiq on 19/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var product : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNav()
    }
    
    func setProduct(product : Product)  {
        self.product = product
    }
    
    func setNav()  {
           navigationItem.title = "Details"
           let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
           navigationController?.navigationBar.titleTextAttributes = textAttributes
           
           navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart"), landscapeImagePhone: .none, style: .plain, target: self, action: #selector(cartBtnTapped))
    }
       
       @objc func cartBtnTapped() {
            let storyboard = UIStoryboard(name: "Cart", bundle: nil)
            let cartVC = storyboard.instantiateViewController(identifier: "CartVC") as! CartVC
                      
           navigationController?.pushViewController(cartVC, animated: true)
       }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsMainTableViewCell", for: indexPath) as! ProductDetailsMainTableViewCell
        
        if let product = self.product {
            cell.updateView(product: product)
        }
        
        
        return cell
    }

}
