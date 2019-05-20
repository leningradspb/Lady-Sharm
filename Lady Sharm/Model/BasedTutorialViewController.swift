//
//  BasedTutorialViewController.swift
//  
//
//  Created by Eduard Sinyakov on 21/04/2019.
//

import UIKit

let keyForBasedController = "keyForBasedController"

class BasedTutorialViewController: UIViewController {
    
    
    
    let themeSkin: Product! =  ThemeStyleSingleton.shared.getCurrentThemeSkin()
    
    
    
    
    
    
    var backgroundImageView = UIImageView()
    
    var basedImageName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        basedImageName = ThemeStyleSingleton.shared.getCurrentThemeSkin().imageName
        
        
//        // TODO: Написана фигня
//        if UserDefaults.standard.object(forKey: keyForBasedController) == nil {
//
//        } else {
////            basedImageName = themeSkin.imageName
//            basedImageName = "bg2"
//        }

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
