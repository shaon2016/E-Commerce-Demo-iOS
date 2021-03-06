//
//  FormatTabController.swift
//  SalahAndDua
//
//  Created by Ashiq  on 12/4/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import UIKit

class FormatTabController {
    static let instance = FormatTabController()
    
    init() {
        
    }
    
    func getFormattedTabController(withTabController tabBarController : UITabBarController) -> UITabBarController {
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let categoryStoryboard = UIStoryboard(name: "Category", bundle: nil)
        let accountStoryboard = UIStoryboard(name: "Account", bundle: nil)
        
        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let categoryVC = categoryStoryboard.instantiateViewController(withIdentifier: "CatVC") as! CategoryViewController
        let accountVC = accountStoryboard.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
        
        
        let vcData : [(UIViewController, UIImage, UIImage)] = [
            (homeVC, UIImage(named: "home_tab_icon")!, UIImage(named: "home_selected_tab_icon")!),
          
            (categoryVC, UIImage(named: "category_tab_icon")!, UIImage(named: "category_selected_tab_icon")!),
            
            (accountVC, UIImage(named: "user_tab_icon")!, UIImage(named: "user_selected_tab_icon")!),
            
            
        ]
        
        let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UINavigationController in
            
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = defaultImage
            nav.tabBarItem.selectedImage = selectedImage
            
            
            nav.navigationBar.barTintColor = .systemRed
            nav.navigationBar.tintColor = .white
            
            
            return nav
        }
        
        tabBarController.viewControllers = vcs
        tabBarController.tabBar.isTranslucent = false
        
        // tabBarController.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        if let items = tabBarController.tabBar.items {
            
            
            for item in items {
                
                if let image = item.image {
                    item.image = image.withRenderingMode(.alwaysOriginal)
                }
                
                if let selectedImage = item.selectedImage {
                    item.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
                }
                
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
        
        return tabBarController
    }
}
