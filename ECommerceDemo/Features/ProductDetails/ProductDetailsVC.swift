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

        
    }
    
    func setProduct(product : Product)  {
        self.product = product
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
