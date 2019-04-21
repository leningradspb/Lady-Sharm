//
//  ThirdTutorialViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 21/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class ThirdTutorialViewController: BasedTutorialViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var yellowLabel: UILabel!
    var timerOne = Timer()
    var timerTwo = Timer()
    var timerThree = Timer()
    var timerFour = Timer()
    var secondsForTimer = 200
    var secondsForSecondTimer = 200
    var secondsForThirdTimer = 200
    var secondsForFourTimer = 200
    let currentPoint = 0
    
    @IBOutlet weak var skipBO: UIButton!
    @IBOutlet weak var okBO: UIButton!
    @IBAction func okAction(_ sender: UIButton) {
        
        
        if label.text == "НЕТ СОВПАДЕНИЯ. УСПЕЙ ЗАПОМНИТЬ ВТОРУЮ КАРТОЧКУ ДО ТОГО, КАК КАРТОЧКИ АВТОМАТИЧЕСКИ ПЕРЕВЕРНУТСЯ" {
            
            // остановить пульсацию
            
            label.text = "ВЫБЕРИ ТРЕТЬЮ КАРТОЧКУ"
            
            // установить задние рубашки
            firstBO.setImage(UIImage(named: "rectangle432"), for: .normal)
            secondBO.setImage(UIImage(named: "rectangle432"), for: .normal)
            
            thirdBO.pulsate()
            thirdBO.isEnabled = true
            firstBO.isEnabled = false
            secondBO.isEnabled = false
            
            timerThree = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFuncThree), userInfo: nil, repeats: true)
            
            okBO.isHidden = true
        } else {
            label.text = "ВЫБЕРИ ЧЕТВЕРТУЮ КАРТОЧКУ"
            firstBO.isHidden = true
            thirdBO.isHidden = true
            okBO.isHidden = true
            secondsForFourTimer = 200
            timerFour = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFuncFour), userInfo: nil, repeats: true)
            fourthBO.isEnabled = true
        }
    }
    
    
    
    @IBAction func fourthBA(_ sender: UIButton) {
        
        secondsForFourTimer = 0
        secondsForSecondTimer = 200
        fourthBO.setImage(UIImage(named: "3"), for: .normal)
        label.text = "ВЫБЕРИ ПОСЛЕДНЮЮ КАРТОЧКУ"
        secondBO.isEnabled = true
    }
    @IBAction func thirdBA(_ sender: UIButton) {
        timerThree.invalidate()
        thirdBO.setImage(UIImage(named: "4"), for: .normal)
        secondsForThirdTimer = 0
        
        label.text = "ВЫБЕРИ ПЕРВУЮ КАРТОЧКУ"
        secondsForTimer = 100
        firstBO.isEnabled = true
        
    }
    @IBAction func secondBA(_ sender: UIButton) {
        
        
        if label.text == "ВЫБЕРИ ПОСЛЕДНЮЮ КАРТОЧКУ" {
            
            secondsForSecondTimer = 0
            
            secondBO.setImage(UIImage(named: "3"), for: .normal)
            
            label.text = "ПОБЕДА! УДАЧНОЙ ИГРЫ!"
            skipBO.setTitle("ИГРАТЬ!", for: .normal)
            secondBO.isEnabled = false
            fourthBO.isEnabled = false
            skipBO.pulsate()
            skipBO.setTitleColor(.white, for: .normal)
            
        } else {
            
            //firstBO.setImage(UIImage(named: "background"), for: .normal)
            
            secondsForSecondTimer = 0
            
            secondBO.setImage(UIImage(named: "3"), for: .normal)
            
            label.text = "НЕТ СОВПАДЕНИЯ. УСПЕЙ ЗАПОМНИТЬ ВТОРУЮ КАРТОЧКУ ДО ТОГО, КАК КАРТОЧКИ АВТОМАТИЧЕСКИ ПЕРЕВЕРНУТСЯ"
            okBO.isHidden = false
        }
    }
    @IBAction func firstBA(_ sender: UIButton) {
        
        
        if label.text == "ВЫБЕРИ ПЕРВУЮ КАРТОЧКУ"{
            
            label.text = "СОВПАДЕНИЕ, ОТЛИЧНО!"
            
            firstBO.setImage(UIImage(named: "4"), for: .normal)
            
            secondsForTimer = 0
            
            okBO.isHidden = false
            
        } else {
            
            secondBO.pulsate()
            secondsForTimer = 0
            firstBO.setImage(UIImage(named: "4"), for: .normal)
            secondBO.isEnabled = true
            
            label.text = "ПОСТАРАЙСЯ ЗАПОМНИТЬ ПЕРВУЮ КАРТОЧКУ, ЗАТЕМ ПЕРЕВЕРНИ ВТОРУЮ КАРТОЧКУ"
            
            timerTwo = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFuncTwo), userInfo: nil, repeats: true)
        }
    }
    @IBOutlet weak var fourthBO: UIButton!
    @IBOutlet weak var thirdBO: UIButton!
    @IBOutlet weak var secondBO: UIButton!
    @IBOutlet weak var firstBO: UIButton!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yellowLabel.textColor = UIColor(red: 254/255, green: 237/255, blue: 0/255, alpha: 1)
        
        label.text = "ПЕРЕВЕРНИ ПЕРВУЮ КАРТОЧКУ"
        timerOne = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        firstBO.pulsate()
        secondBO.isEnabled = false
        thirdBO.isEnabled = false
        fourthBO.isEnabled = false
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        right.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(right)
    } // конец ViewDidLoad
    
    
    @objc func timerFunc() {
        
        if secondsForTimer > 0 {
            secondsForTimer -= 1
            
            firstBO.pulsate()
        }
        
        if secondsForTimer == 0  {
            
            
            
        }
    }
    
    @objc func timerFuncTwo() {
        
        if secondsForSecondTimer > 0 {
            secondsForSecondTimer -= 1
            
            secondBO.pulsate()
        }
        
        if secondsForSecondTimer == 0  {
            
            
            
        }
    }
    
    @objc func timerFuncThree() {
        
        if secondsForThirdTimer > 0 {
            secondsForThirdTimer -= 1
            
            thirdBO.pulsate()
        }
        
        if secondsForThirdTimer == 0  {
            
            
            
        }
    }
    
    @objc func timerFuncFour() {
        
        if secondsForFourTimer > 0 {
            secondsForFourTimer -= 1
            
            fourthBO.pulsate()
        }
        
        if secondsForFourTimer == 0  {
            
            
            
        }
    }
    

    

}


extension ThirdTutorialViewController {
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        
        if swipe.direction.rawValue == UISwipeGestureRecognizer.Direction.right.rawValue {
            performSegue(withIdentifier: "ThirdToSecond", sender: self)
        }
        
    }
}
