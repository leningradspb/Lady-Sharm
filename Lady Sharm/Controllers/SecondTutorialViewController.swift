//
//  SecondTutorialViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 21/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class SecondTutorialViewController: BasedTutorialViewController {

   var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
