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
        
        
        createObservers()
        
    }
    
    //MARK: - OBSERVERS for update imageViewImage. 
    func createObservers() {
        //firstImage
        NotificationCenter.default.addObserver(self, selector: #selector(updateImageViewImage(notification:)), name: Notification.Name(rawValue: firstThemeIsSelectedKey), object: nil)
        
        //secondImage
         NotificationCenter.default.addObserver(self, selector: #selector(updateImageViewImage(notification:)), name: Notification.Name(rawValue: secondThemeIsSelectedKey), object: nil)
        //thirdImage
         NotificationCenter.default.addObserver(self, selector: #selector(updateImageViewImage(notification:)), name: Notification.Name(rawValue: thirdThemeIsSelectedKey), object: nil)
    }
    
   @objc func updateImageViewImage(notification: NSNotification) {
    
    if notification.name == Notification.Name(rawValue: firstThemeIsSelectedKey) {
        backgroundImageView.image = UIImage(named: "bg")
    } else if notification.name == Notification.Name(rawValue: secondThemeIsSelectedKey) {
        backgroundImageView.image = UIImage(named: "bg1")
    } else if notification.name == Notification.Name(rawValue: thirdThemeIsSelectedKey) {
        backgroundImageView.image = UIImage(named: "bg2")
    }
  
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
