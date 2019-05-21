//
//  StoreManager.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 16/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation


class StoreManager {
    
    func handleProduct(productId: Int) -> Void {
        
        //get product object by id
        let product: Product! = ProductProvider.getProductById(id: productId)
        
        //get purchased products from userdefaults
        // if productId is purchased -> change style
        
        if(PurchasedProductsManager().checkIfProductPurchased(product: product)) {
            
           
           
            //change app style
            
            switch product.type {
            case .skin?:
                changeCardSkin(cardSkinModel: product)
                break
            case .wallpaper?:
                
                
                
                let name4 = Notification.Name(rawValue: fourthThemeIsSelectedKey)
                let name5 = Notification.Name(rawValue: fifthThemeIsSelectedKey)
                let name6 = Notification.Name(rawValue: sixthThemeIsSelectedKey)
                //                let name4 = Notification.Name(rawValue: imageDidChanged)
                //                let name5 = Notification.Name(rawValue: imageDidChangedFromSecondID)
                //                let name6 = Notification.Name(rawValue: imagelDidChangedFromThirdID)
                
                if productId == 4 {
                    print("I have posted notification")
                    NotificationCenter.default.post(name: name4, object: nil)
                    NotificationCenter.default.post(name: Notification.Name(rawValue: imageDidChanged), object: nil)
                } else if productId == 5 {
                    NotificationCenter.default.post(name: name5, object: nil)
                    NotificationCenter.default.post(name: Notification.Name(rawValue: imageDidChangedFromSecondID), object: nil)
                } else if productId == 6 {
                    NotificationCenter.default.post(name: name6, object: nil)
                    NotificationCenter.default.post(name: Notification.Name(rawValue: imagelDidChangedFromThirdID), object: nil)
                }
                
                
                changeWallpaper(wallpaperSkinModel: product)
                break
                
            default:
                break
            }
            
        } else {
            
            
            // MARK: Scores().getScores() >= 500
            if Scores().getScores() >= 0 {
                
               
                
                
            //purchase product
            let name1 = Notification.Name(rawValue: labelDidChanged)
            let name2 = Notification.Name(rawValue: labelDidChangedFromSecondID)
            let name3 = Notification.Name(rawValue: labelDidChangedFromThirdID)
                
                
                //MARK: - Notification POST (для обновления backgroundImageView в BasedVC)
          
            
            if productId == 1 {
                NotificationCenter.default.post(name: name1, object: nil)
                // MARK: - или в Userdefaults записывается здесь?
                // example  UserDefaults.standard.set(productId, forKey: "productId")
            } else if productId == 2 {
                NotificationCenter.default.post(name: name2, object: nil)
            } else if productId == 3 {
                NotificationCenter.default.post(name: name3, object: nil)
            }
            
            purchaseProduct(product: product)
            }
        }
        
    }
    
    func changeWallpaper(wallpaperSkinModel: Product) {
        //TODO: прописать логику
        print("меняем обои на продакт \(wallpaperSkinModel.imageName)")
        ThemeStyleSingleton.shared.setCurrentCardSkin(themeSkin: wallpaperSkinModel)
    }
    
    
    func purchaseProduct(product: Product) {
        
        if !PurchasedProductsManager().checkIfProductPurchased(product: product) {
           PurchasedProductsManager().purchaseProduct(product: product)
        }
        
        // get product by id
        // if money is enough -> complete purchase -> change button to "Установить"
        // else popup "not enough money"
    }
    
    
    func changeCardSkin(cardSkinModel: Product) {
        
        CardStyleSingleton.shared.setCurrentCardSkin(cardSkin: cardSkinModel)
        
    }
    
    
}
