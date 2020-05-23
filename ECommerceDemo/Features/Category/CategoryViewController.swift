//
//  CategoryViewController.swift
//  ECommerceDemo
//
//  Created by Ashiq on 23/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    lazy var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView.tag {
        case 1:
            return model.categories.count
        default:
            return model.categories[0].subcategories.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch tableView.tag {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as!
            CategoryTableViewCell
            
            cell.updateView(category: model.categories[indexPath.row])
            
            return cell
        
        case 2 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryTableViewCell", for: indexPath) as!
            SubCategoryTableViewCell
            
            cell.updateView(subcategory: model.categories[0].subcategories[indexPath.row])
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
        
    }
    
}
