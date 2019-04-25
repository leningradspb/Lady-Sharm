//
//  Shop.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 24/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation

class Shop {
    
    var thems = [Thems]()
    var cards = [Card]()
    var money = Int()
    
    
    func cardOne() -> [Card] {
        
        let cardOne = Card()
        cardOne.backImageName       = "skin1"
        cards.append(cardOne)
        
        return cards
    }
    
    func buyCardTwo() -> [Card] {
        
        let cardTwo = Card()
        
        
        cardTwo.backImageName       = "skin2"
        
        
        // добавить в массив карт
        cards.append(cardTwo)
        
        return cards
    }
    
    func buyCardThree() -> [Card] {
        let cardThree = Card()
        cardThree.backImageName     = "skin3"
        
        cards.append(cardThree)
        
        return cards
    }
    
    func buyThems() -> [Thems] {
        
        
        return thems
    }
}
