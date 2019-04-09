//
//  EndGameViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    
    var label = UILabel()
    var lableInt = Scores().score
    
    var pointsLabelFromSegue = UILabel()
    var timerLabelFromSegue = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        winOrLoseLabel.text = label.text
        if label.text == "ВЫ ПРОИГРАЛИ!" {
           pointsLabel.text = "0"
        } else {
            pointsLabel.text = pointsLabelFromSegue.text
        }
        timerLabel.text = timerLabelFromSegue.text
        
        lableInt = Int(pointsLabel.text!)!
        
       setupColors()
    }
    

    @IBAction func menu(_ sender: UIButton) {
      
    }
    @IBOutlet weak var winOrLoseLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    func setupColors() {
        winOrLoseLabel.textColor = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        timerLabel.textColor = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        pointsLabel.textColor = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
    }
    
}
