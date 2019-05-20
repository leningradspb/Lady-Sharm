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
        shopMenu.id = 1
        shopMenu.itemName = "Стандарт"
        shopMenu.imageName = "skin1"
        shopMenu.buttonImageName = "btnInstalled"
        shopMenu.price = "0"
        shopMenu.type = .skin
        
        let shopMenu2 = Product()
        shopMenu2.id = 2
        shopMenu2.itemName = "Скин №1"
        shopMenu2.imageName = "skin2"
        shopMenu2.buttonImageName = "btnBuy"
        shopMenu2.type = .skin
        shopMenu2.price = "5000"
        //shopMenu2.price = UserDefaults.standard.object(forKey: "priceLabel.text") as? String
        
        let shopMenu3 = Product()
        shopMenu3.id = 3
        shopMenu3.itemName = "Скин №2"
        shopMenu3.imageName = "skin3"
        shopMenu3.buttonImageName = "btnBuy"
        shopMenu3.type = .skin
        shopMenu3.price = "50000"
        
        return [shopMenu, shopMenu2, shopMenu3]
    }
    
    static func getThemeProducts() -> [Product] {
        
        let shopMenu4 = Product()
        shopMenu4.id = 4
        shopMenu4.itemName = "Стандарт"
        shopMenu4.imageName = "bg"
        shopMenu4.buttonImageName = "btnInstalled"
        shopMenu4.price = "0"
        shopMenu4.type = .wallpaper
        
        let shopMenu5 = Product()
        shopMenu5.id = 5
        shopMenu5.itemName = "Тема №1"
        shopMenu5.imageName = "bg1"
        shopMenu5.buttonImageName = "btnBuy"
        shopMenu5.type = .wallpaper
        shopMenu5.price = "5000"
       // shopMenu5.price = UserDefaults.standard.object(forKey: "priceLabel.text") as? String
        
        let shopMenu6 = Product()
        shopMenu6.id = 6
        shopMenu6.itemName = "Тема №2"
        shopMenu6.imageName = "bg2"
        shopMenu6.buttonImageName = "btnBuy"
        shopMenu6.type = .wallpaper
        shopMenu6.price = "50000"
        
        return [shopMenu4, shopMenu5, shopMenu6]
    }
    
    static func getDefaultThemeProduct() -> Product {
        
        let shopMenu4 = Product()
        shopMenu4.id = 4
        shopMenu4.itemName = "Стандарт"
        shopMenu4.imageName = "bg"
        shopMenu4.buttonImageName = "btnInstalled"
        shopMenu4.price = "0"
        shopMenu4.type = .wallpaper
        
        return shopMenu4
        
    }
    
    static func getDefaultSkinProduct() -> Product {
        let shopMenu = Product()
        shopMenu.id = 1
        shopMenu.itemName = "Стандарт"
        shopMenu.imageName = "skin1"
        shopMenu.buttonImageName = "btnInstalled"
        shopMenu.price = "0"
        shopMenu.type = .skin
        
        return shopMenu
    }
    
    
    static func getProductById(id: Int) -> Product? {
        
        //get all products in one place
        var products: [Product] = ProductProvider.getProducts()
        products.append(contentsOf: ProductProvider.getThemeProducts())
        
  
        
        for i in products {
            if i.id == id {
                return i
            }
            print(products)
        
        }
        return nil
        
    }
}
