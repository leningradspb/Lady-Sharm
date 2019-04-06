//
//  GameSceneViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class GameSceneViewController: UIViewController {
    
    
    
    var timer = Timer()
    
    // модель карт
    var model = CardModel()
    // вспомогательная переменная
    var cardArray = [Card]()
    
    // переменная для определения перевернута карта или нет
    var firstCardIsFlippedIndex: IndexPath?
    
    var secondsForTimer = 60
    var currentPoints = 0
    

    @IBAction func pause(_ sender: UIButton) {
        menuBO.isHidden = false
        continueBO.isHidden = false
        collectionView.isHidden = true
        timer.invalidate()
    }
    @IBAction func continueGame(_ sender: UIButton) {
        menuBO.isHidden = true
        continueBO.isHidden = true
        collectionView.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    @IBOutlet weak var continueBO: UIButton!
    @IBOutlet weak var menuBO: UIButton!
    @IBOutlet weak var pauseLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // делегаты
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // вызвать гет кардс(массив карт) и передать данные в вспомогательную переменную
     

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
      //  timerLabel.text = String(secondsForTimer)
        
    } // конец viewDidLoad
    
    @objc func timerFunc() {
        
        if secondsForTimer > 0 {
        secondsForTimer -= 1
            let seconds = String(format: "%d", secondsForTimer)
            timerLabel.text = seconds
            
            if cardArray.endIndex == 16 && pointsLabel.text == "1600" {
                performSegue(withIdentifier: "toEndVC", sender: self)
            } else if cardArray.endIndex == 24 && pointsLabel.text == "2400" {
                performSegue(withIdentifier: "toEndVC", sender: self)
            } else if cardArray.endIndex == 48 && pointsLabel.text == "4800" {
                performSegue(withIdentifier: "toEndVC", sender: self)
            }
            
        }
        
        if secondsForTimer == 0  {
            performSegue(withIdentifier: "toEndVC", sender: self)
            timer.invalidate()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEndVC" {
            let dvc = segue.destination as! EndGameViewController
            
            if timerLabel.text == "0" {
                dvc.label.text = "ВЫ ПРОИГРАЛИ!"
                dvc.pointsLabelFromSegue.text = pointsLabel.text
                dvc.timerLabelFromSegue.text = timerLabel.text
            } else {
                dvc.label.text = "ВЫ ВЫИГРАЛИ!"
                dvc.pointsLabelFromSegue.text = pointsLabel.text
                dvc.timerLabelFromSegue.text = timerLabel.text
            }
            
        }
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
}

extension GameSceneViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
      return  cardArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CellCollectionViewCell
        
        // конкретная карта из массива
        let card = cardArray[indexPath.row]
        // установить карту из массива в фронт имэдж в коллекшвьюСелл (ячейка)
        cell.setCard(card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CellCollectionViewCell
        
        // карта, которую выбрал юзер
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false{
            cell.flip()
            // установить нвоый статус
            card.isFlipped = true
            
            // выяснить это первая катра или вторая перевернуты?
            if firstCardIsFlippedIndex == nil {
                // это первая карта перевернута
                firstCardIsFlippedIndex = indexPath
                
            } else {
                // это вторая карта
                checkForMatches(indexPath)
            }
            
        }
        
    } // конец дидСелектАйтем
    
    // MARK: Игровая логика
    func checkForMatches(_ secondCardIsFlippedIndex: IndexPath) {
        // ячейки для двух карт
        let cardOneCell = collectionView.cellForItem(at: firstCardIsFlippedIndex!) as? CellCollectionViewCell
        
        let cardTwoCell = collectionView.cellForItem(at: secondCardIsFlippedIndex) as? CellCollectionViewCell
        
        // карты для двух карт
        let cardOne = cardArray[firstCardIsFlippedIndex!.row]
        let cardTwo = cardArray[secondCardIsFlippedIndex.row]
        
      if cardOne.imageName == cardTwo.imageName {
            // совпадение
            
            // статусы карт
        cardOne.isMatched = true
        cardTwo.isMatched = true
        
            
            // убрать из коллекшн вью
            cardOneCell?.remove()
            cardTwoCell?.remove()
        
        currentPoints += 200
        
        pointsLabel.text = String(currentPoints)
        
        } else {
            //нет совпадения
            
            // статус карт
        cardOne.isFlipped = false
        cardTwo.isFlipped = false
            
            // развернуть карты
        cardOneCell?.flipBack()
        cardTwoCell?.flipBack()
        
        }
        
       /* if cardOne.isMatched == false && cardTwo.isMatched == false {
            // статус карт
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
        } */
        
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstCardIsFlippedIndex!])
        }
        
        // перезапустить проверку
        firstCardIsFlippedIndex = nil
    }

    // выставить размеры
  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if cardArray.endIndex == 16 {
            return CGSize(width: 220, height: 120)
        }
        
        return CGSize(width: 200, height: 70)
        
    } */
    
    
    
} // конец екстеншена
