//
//  CardStyleSingleton.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 16/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class CardStyleSingleton: NSObject {
    
    
    static let shared = CardStyleSingleton()
    
    
    var cardSkin: Product!
    
    
    private override init() {
        
    }
    
    func getCurrentCardSkin() -> Product {
        
        if cardSkin == nil {
            return ProductProvider.getDefaultSkinProduct()
        } else {
            return cardSkin
        }
    }
    
    func setCurrentCardSkin(cardSkin: Product) -> Void {
        self.cardSkin = cardSkin
    }
    
    
    
}
