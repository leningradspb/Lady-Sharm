//
//  BasedTutorialViewController.swift
//  
//
//  Created by Eduard Sinyakov on 21/04/2019.
//

import UIKit

let keyForBasedController = "keyForBasedController"

class BasedTutorialViewController: UIViewController {
    
    
    
    var backgroundImageView = UIImageView()
    
    var basedImageName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: keyForBasedController) == nil {
            basedImageName = "bgs"
        } else {
            basedImageName = "bg1"
        }

        setupBackgroundImage()
        
        
    }
    

    func setupBackgroundImage() {
        backgroundImageView.image = UIImage(named: basedImageName)
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
}
