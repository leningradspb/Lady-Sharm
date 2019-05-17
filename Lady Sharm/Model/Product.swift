//
//  Product.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 16/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class Product: NSObject {

    var id: Int!
    var itemName: String?
    var price: String?
    var imageName: String!
    var buttonImageName: String?
    
    var type: ProductType?
    
}


enum ProductType {
    case skin
    case wallpaper
}
