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
        
        
        setNav()
    }
    
    
    func setNav()  {
        navigationItem.title = "Cart"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart"), landscapeImagePhone: .none, style: .plain, target: self, action: #selector(cartBtnTapped))
    }
    
    @objc func cartBtnTapped() {
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let cartVC = storyboard.instantiateViewController(identifier: "CartVC") as! CartVC
        
        navigationController?.pushViewController(cartVC, animated: true)
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
