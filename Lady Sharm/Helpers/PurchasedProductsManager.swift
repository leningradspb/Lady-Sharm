//
//  PurchasedProductsManager.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 20/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit
let purchasedProductsUserDefaultsKey = "purchasedProducts"
class PurchasedProductsManager: NSObject {
    
   // var allPurchasedProducts = [Product]()

    // получить список купленных
    func getAllPurchasedProducts() -> [Int] {
        
        //get from USERDefalts all products and return
        
        if  UserDefaults.standard.object(forKey: purchasedProductsUserDefaultsKey) == nil {
            var purchasedProducts: [Int] = Array()
            purchasedProducts.append(ProductProvider.getProductById(id: 1)!.id)
            purchasedProducts.append(ProductProvider.getProductById(id: 4)!.id)
            UserDefaults.standard.set(purchasedProducts, forKey: purchasedProductsUserDefaultsKey)
            UserDefaults.standard.synchronize()
        }
        
        
        
        // по дефолту куплена только первая рубашка и первая тема.Нужна переменная - массив продуктов?
        // var allPurchasedProducts = [Product]   ???
        
        return UserDefaults.standard.object(forKey: purchasedProductsUserDefaultsKey) as! [Int]
    }
    
    // купить продукт
    func purchaseProduct(product: Product) {
        
        //принимать продукт или id
        // не понял. переменная - массив allPurchasedProducts???
        var purchasedProducts = getAllPurchasedProducts()
        purchasedProducts.append(product.id)
        UserDefaults.standard.set(purchasedProducts, forKey: purchasedProductsUserDefaultsKey)
        UserDefaults.standard.synchronize()
        
        //record in user defaults
        // Userdefaults.standart.set(? переменная, которая массив allPurchasedProducts ???)
    }
    
    func checkIfProductPurchased(product: Product) -> Bool {
        
        //get all products from user defaults
       // Userdefaults.standart.object или value (? переменная, которая массив allSkins ???)
//        if getAllPurchasedProducts() {
            //cicle though them
            
             for i in getAllPurchasedProducts() {
                //// ?
                if i == product.id {
                    return true
                }
                //return if purchased
                
            
                
              //  return i ?
            
             }
//        }
      
        
        
        
        return false
    
    }
}
