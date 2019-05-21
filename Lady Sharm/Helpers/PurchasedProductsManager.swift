//
//  PurchasedProductsManager.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 20/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class PurchasedProductsManager: NSObject {

    func getAllPurchasedProducts() -> [Product] {
        
        //get from USERDefalts all products and return
        
        return [Product()]
    }
    
    func purchaseProduct(product: Product) {
        //принимать продукт или id
        
        //record in user defaults
    }
    
    func checkIfProductPurchased(product: Product) -> Bool {
        
        //get all products from user defaults
        
        //cicle though them
        //return if purchased
        return true
    }
    
}
