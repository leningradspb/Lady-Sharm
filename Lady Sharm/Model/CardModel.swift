//
//  CardModel.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCardSixteenCards() -> [Card] {
        
        // массив с картами
        var generatedCardsArray = [Card]()
        
        // сгенерировать случайные картинки для нормального уровня
        for _ in 1...8 {
            
            let randomNumber = arc4random_uniform(24) + 1
            
            // Первая карта
            let cardOne = Card()
            // присвоить фрон имэдж из слуайного номера
            cardOne.imageName = String(randomNumber)
            // добавить в массив карт
            generatedCardsArray.append(cardOne)
            
            // Вторая карта
            let cardTwo = Card()
            // присвоить такое же имя и картинку
            cardTwo.imageName = String(randomNumber)
            // добавить в массив
            generatedCardsArray.append(cardTwo)
            }
        return generatedCardsArray
    }
        
        
        func getCardsTwentyFour() -> [Card] {
            
            // массив с картами
            var generatedCardsArray = [Card]()
        
        // сгенерировать случайные картинки для сложного уровня
        for _ in 1...12 {
            
            let randomNumber = arc4random_uniform(24) + 1
            
            // Первая карта
            let cardOne = Card()
            // присвоить фрон имэдж из слуайного номера
            cardOne.imageName = String(randomNumber)
            // добавить в массив карт
            generatedCardsArray.append(cardOne)
            
            // Вторая карта
            let cardTwo = Card()
            // присвоить такое же имя и картинку
            cardTwo.imageName = String(randomNumber)
            // добавить в массив
            generatedCardsArray.append(cardTwo)
        }
            return generatedCardsArray.shuffled()
    }
    
    
    func getCardsFortyEight() -> [Card] {
        
        // массив с картами
        var generatedCardsArray = [Card]()
        
        // сгенерировать случайные картинки для экстримального уровня
        for _ in 1...24 {
            
            let randomNumber = arc4random_uniform(24) + 1
            
            // Первая карта
            let cardOne = Card()
            // присвоить фрон имэдж из слуайного номера
            cardOne.imageName = String(randomNumber)
            // добавить в массив карт
            generatedCardsArray.append(cardOne)
            
            // Вторая карта
            let cardTwo = Card()
            // присвоить такое же имя и картинку
            cardTwo.imageName = String(randomNumber)
            // добавить в массив
            generatedCardsArray.append(cardTwo)
        }
        
        return generatedCardsArray.shuffled()
        
    }
}
