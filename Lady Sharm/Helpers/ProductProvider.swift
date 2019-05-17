//
//  ProductProvider.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 16/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation

class ProductProvider {
    
    static func getProducts() -> [Product] {
        
        let shopMenu = Product()
        shopMenu.id = 0
        shopMenu.itemName = "Стандарт"
        shopMenu.imageName = "skin1"
        shopMenu.buttonImageName = "btnInstalled"
        shopMenu.price = "0"
        shopMenu.type = .skin
        
        let shopMenu2 = Product()
        shopMenu2.id = 1
        shopMenu2.itemName = "Скин №1"
        shopMenu2.imageName = "skin2"
        shopMenu2.buttonImageName = "btnBuy"
        shopMenu2.type = .skin
        //shopMenu2.price = "5000"
        shopMenu2.price = UserDefaults.standard.object(forKey: "priceLabel.text") as? String
        
        let shopMenu3 = Product()
        shopMenu3.id = 3
        shopMenu3.itemName = "Скин №2"
        shopMenu3.imageName = "skin3"
        shopMenu3.buttonImageName = "btnBuy"
        shopMenu3.type = .wallpaper
        shopMenu3.price = "50000"
        
        return [shopMenu, shopMenu2, shopMenu3]
    }
    
    static func getProductById(id: Int) -> Product? {
        
        let products = ProductProvider.getProducts()
        for i in products {
            if i.id == id {
                return i
            }
           
        }
        
        return nil
        
    }
    
    
}
