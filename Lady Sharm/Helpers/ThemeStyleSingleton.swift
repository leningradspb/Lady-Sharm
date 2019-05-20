//
//  ThemeStyleSingleton.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 17/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation
import UIKit

class ThemeStyleSingleton: NSObject {
    
    
    static let shared = ThemeStyleSingleton()
    
    
    var themeSkin: Product!
    
    
    private override init() {
        
    }
    
    func getCurrentThemeSkin() -> Product {
        
           if themeSkin == nil {
            return ProductProvider.getDefaultThemeProduct()
           } else {
            return themeSkin
        }
    }
    
    func setCurrentCardSkin(themeSkin: Product) -> Void {
        self.themeSkin =  themeSkin
    }
    
    
    
}
