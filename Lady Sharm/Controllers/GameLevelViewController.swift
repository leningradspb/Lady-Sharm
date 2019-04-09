//
//  GameLevelViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class GameLevelViewController: UIViewController {
    
    let model = CardModel()
    
    @IBOutlet weak var lableValueLevel: UILabel!
    @IBAction func toGame(_ sender: UIButton) {
        
        if  normalImage.image == UIImage(named: "EmptyselectionControlRadioOnDisabled") &&
            hardImage.image == UIImage(named: "EmptyselectionControlRadioOnDisabled") &&
            extreemImage.image == UIImage(named: "EmptyselectionControlRadioOnDisabled") {
            
            alertController.addAction(action)
            
            present(alertController, animated: true)
        } else {
            performSegue(withIdentifier: "gameLevelToGameScene", sender: sender)
        }
    }
    
    
    @IBAction func normalLevel(_ sender: UIButton) {
        normalImage.image = UIImage(named: "selectionControlRadioOnDisabled")
        hardImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
        extreemImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
        
    }
    @IBOutlet weak var hardBO: UIButton!
    
    @IBOutlet weak var extreemBO: UIButton!
    @IBOutlet weak var normalBO: UIButton!
    @IBAction func hardLevel(_ sender: UIButton) {
        normalImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
        hardImage.image = UIImage(named: "selectionControlRadioOnDisabled")
        extreemImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
    }
   
    
    @IBOutlet weak var normalImage: UIImageView!
    @IBOutlet weak var hardImage: UIImageView!
    @IBOutlet weak var extreemImage: UIImageView!
    @IBAction func extreemLevel(_ sender: UIButton) {
        normalImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
        hardImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
        extreemImage.image = UIImage(named: "selectionControlRadioOnDisabled")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColorsOfButtons()
        stratConditionsOfButtons()
    }
    
    func setupColorsOfButtons() {
        extreemBO.clipsToBounds = true
        extreemBO.layer.cornerRadius = 5
        extreemBO.layer.borderWidth = 1.5
        extreemBO.layer.borderColor = UIColor(red: 233/255, green: 156/255, blue: 1/255, alpha: 1).cgColor
        // 233 156 1
        hardBO.clipsToBounds = true
        hardBO.layer.cornerRadius = 5
        hardBO.layer.borderWidth = 1.5
        hardBO.layer.borderColor = UIColor(red: 233/255, green: 156/255, blue: 1/255, alpha: 1).cgColor
        
        normalBO.clipsToBounds = true
        normalBO.layer.cornerRadius = 5
        normalBO.layer.borderWidth = 1.5
        normalBO.layer.borderColor = UIColor(red: 233/255, green: 156/255, blue: 1/255, alpha: 1).cgColor
        
        lableValueLevel.textColor = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameLevelToGameScene" {
            let dvc = segue.destination as! GameSceneViewController
            
            if normalImage.image == UIImage(named: "selectionControlRadioOnDisabled") {
            dvc.cardArray = model.getCardSixteenCards()
            } else if hardImage.image == UIImage(named: "selectionControlRadioOnDisabled") {
                dvc.cardArray = model.getCardsTwentyFour()
                dvc.secondsForTimer = 75
            } else if extreemImage.image == UIImage(named: "selectionControlRadioOnDisabled") {
                dvc.cardArray = model.getCardsFortyEight()
                dvc.secondsForTimer = 111
            }
        }
    }
    
    let alertController = UIAlertController(title: "Уровень сложности не выбран", message: "Выберите уровень сложности", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "ОК", style: .default, handler: nil)
    
    func stratConditionsOfButtons() {
        normalImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
        hardImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
        extreemImage.image = UIImage(named: "EmptyselectionControlRadioOnDisabled")
    }

}
