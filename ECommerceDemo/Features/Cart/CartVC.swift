//
//  CartVC.swift
//  ECommerceDemo
//
//  Created by Ashiq on 22/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class CartVC: UIViewController {
    @IBOutlet weak var cartTableView: UITableView!
    
    private var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

  

}

extension CartVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as!
        CartTableViewCell
        
        cell.updateView(cart: model.carts[indexPath.row])
     
        
        return cell
    }
    
   
}
