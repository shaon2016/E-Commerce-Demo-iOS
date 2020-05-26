//
//  AccountVC.swift
//  ECommerceDemo
//
//  Created by Ashiq on 27/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
        
        let loginVC = authStoryboard.instantiateViewController(withIdentifier: "loginVC")
        
        present(loginVC, animated: true, completion: nil)
    }
    
}
