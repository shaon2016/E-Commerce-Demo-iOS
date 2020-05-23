//
//  Model.swift
//  ECommerceDemo
//
//  Created by Ashiq on 17/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import Foundation
import UIKit

struct Model {
    
    lazy var products = [Product]()
    lazy var carts = [Cart]()
    lazy var categories = [Category]()
    
    init() {
        
        // MARK:- Product
        let product1 = Product(title: "Color Pencils", price: 150.0, image: UIImage(named: "pencils")!, rating: 4)
        let product2 = Product(title: "Black Mouse", price: 450.0, image: UIImage(named: "mouse")!, rating: 2)
        let product3 = Product(title: "Small Keci", price: 25.0, image: UIImage(named: "keci")!, rating: 4)
        let product4 = Product(title: "Black Jacket", price: 550.0, image: UIImage(named: "jackets")!, rating: 4)
        let product5 = Product(title: "Book", price: 1500, image: UIImage(named: "books")!, rating: 5)
        
        products.append(product1)
        products.append(product2)
        products.append(product3)
        products.append(product4)
        products.append(product5)
        
        
        // MARK:- cart
        let cart1 = Cart(product: product1, quantity: 2)
        let cart2 = Cart(product: product2, quantity: 1)
        
        carts.append(cart1)
        carts.append(cart2)
        
        
        // MARK:- Categories
        let type1 = ProductType(title: "Watches & Wristbands")
        let type2 = ProductType(title: "Router")
        let type3 = ProductType(title: "Projector")
        
        var types1 = [ProductType]()
        types1.append(type1)
        types1.append(type2)
        types1.append(type3)
        
        
        let subCat1 = Subcategory(title: "Smart Electronics", productTypes: types1)
        let subCat2 = Subcategory(title: "Audio & Camera", productTypes: types1)
        
        var subCat1s = [Subcategory]()
        subCat1s.append(subCat1)
        subCat1s.append(subCat2)
        
        let cat1 = Category(title: "Electronics", subcategories: subCat1s)
        let cat2 = Category(title: "Computer", subcategories: subCat1s)
        
        categories.append(cat1)
        categories.append(cat2)
        
    }
    
}


struct Product {
    var title : String
    var price : Double
    var image : UIImage
    var rating : Int
    
}

struct Cart {
    let product : Product
    var quantity : Int
}

struct Category {
    let title : String
    let subcategories : [Subcategory]
}

struct Subcategory {
    let title : String
    let productTypes : [ProductType]
}

struct ProductType {
    let title : String
}


