//
//  FirstTutorialViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 21/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class FirstTutorialViewController: BasedTutorialViewController {
    
 

    @IBAction func nextButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "FirstToSecond", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
    }
    
}


extension FirstTutorialViewController {
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        
        if swipe.direction.rawValue == UISwipeGestureRecognizer.Direction.left.rawValue {
            performSegue(withIdentifier: "FirstToSecond", sender: self)
        }
        
     /*  switch swipe.direction.rawValue {
        case 1:
            performSegue(withIdentifier: "SecondToFirst", sender: self)
        case 2:
            performSegue(withIdentifier: "FirstToSecond", sender: self)
        case 3:
            performSegue(withIdentifier: "ThirdToSecond", sender: self)
        default:
            break
        } */
 
    }
}
