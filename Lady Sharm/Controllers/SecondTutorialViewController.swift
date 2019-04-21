//
//  SecondTutorialViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 21/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class SecondTutorialViewController: BasedTutorialViewController {

 
    @IBOutlet weak var labelYellow: UILabel!
    @IBAction func nextBA(_ sender: UIButton) {
        performSegue(withIdentifier: "SecondToThird", sender: self)
    }
    @IBOutlet weak var nextBO: UIButton!
    @IBAction func skip(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelYellow.textColor = UIColor(red: 254/255, green: 237/255, blue: 0/255, alpha: 1)
        nextBO.setTitleColor(UIColor(red: 254/255, green: 237/255, blue: 0/255, alpha: 1), for: .normal)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        right.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(right)
     
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
        
    }
    

}

extension SecondTutorialViewController {
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
     
        if swipe.direction.rawValue == UISwipeGestureRecognizer.Direction.right.rawValue {
            performSegue(withIdentifier: "SecondToFirst", sender: self)
        } else if swipe.direction.rawValue == UISwipeGestureRecognizer.Direction.left.rawValue {
            performSegue(withIdentifier: "SecondToThird", sender: self)
        }
        
    }
}
