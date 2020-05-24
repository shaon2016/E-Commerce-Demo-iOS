//
//  CategoryTableViewCell.swift
//  ECommerceDemo
//
//  Created by Ashiq on 23/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

    func updateView(category : Category)  {
        titleLabel.text = category.title
    }

}
