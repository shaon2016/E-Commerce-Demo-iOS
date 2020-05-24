//
//  CategoryViewController.swift
//  ECommerceDemo
//
//  Created by Ashiq on 23/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var subcategoryTableView: UITableView!
    
    lazy var model = Model()
    private var currentSelectedCategoryIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calling the first row
        categoryTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .none)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView.tag {
        case 1:
            return model.categories.count
        case 2 :
            return model.categories[currentSelectedCategoryIndex].subcategories.count
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
            
            cell.updateView(subcategory: model.categories[currentSelectedCategoryIndex].subcategories[indexPath.row])
            
            cell.layoutIfNeeded()
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.tag == 1 {
            currentSelectedCategoryIndex = indexPath.row
            
            subcategoryTableView.reloadData()
            
        }
        
        
    }
    
   
}
