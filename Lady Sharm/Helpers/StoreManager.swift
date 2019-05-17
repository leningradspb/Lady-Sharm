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
        var product: Product! = ProductProvider.getProductById(id: productId)
        
        //get purchased products from userdefaults
        // if productId is purchased -> change style
        
        if(true) {
            //change app style
            
            switch product.type {
            case .skin?:
                changeCardSkin(cardSkinModel: product)
                break
            case .wallpaper?:
                changeWallpaper(wallpaperSkinModel: product)
                break
                
            default:
                break
            }
            
        } else {
            //purchase product
            
            purchaseProduct(product: product)
        }
    
        
    }
    
    func changeWallpaper(wallpaperSkinModel: Product) {
        //TODO: прописать логику
        print("меняем обои на продакт \(wallpaperSkinModel.imageName)")
    }
    
    
    func purchaseProduct(product: Product) {
        
        // get product by id
        // if money is enough -> complete purchase -> change button to "Установить"
        // else popup "not enough money"
    }
    
    
    func changeCardSkin(cardSkinModel: Product) {
        
        CardStyleSingleton.shared.setCurrentCardSkin(cardSkin: cardSkinModel)
        
    }
    
    
}
