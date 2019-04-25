//
//  StoreCollectionViewCell.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 24/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    
    var vcPoints = ViewController()
   var priceOfIcon = 500
    
    var shopMenuModel: ShopMenu? {
        didSet {
            descriptionLabel.text = shopMenuModel?.itemName
            priceLabel.text       = shopMenuModel?.price
            if let image          = shopMenuModel?.imageName {
                imageViewCell.image = UIImage(named: image)
            }
            if let imageButton = shopMenuModel?.buttonImageName {
                buttonCellOutlet.setBackgroundImage(UIImage(named: imageButton), for: .normal)
            }
        }
    }
    
    @IBAction func buttonCellAction(_ sender: UIButton) {
        
        if priceLabel.text == "0" {
            buttonCellOutlet.setBackgroundImage(UIImage(named: "btnInstall"), for: .normal)
            priceLabel.text = String(Int(priceLabel.text!)! - 5000)
            
            
        }
        
        //sender.setBackgroundImage(UIImage(named: "btnInstalled"), for: .normal)
     /*   if  buttonCellOutlet.currentBackgroundImage == UIImage(named: "btnBuy")   {
           // Int(lable.pointsLabelStore.text!) = Int(lable.pointsLabelStore.text) - Int(priceLabel.text!)

        }
        
        if  buttonCellOutlet.currentBackgroundImage == UIImage(named: "btnInstalled") || buttonCellOutlet.currentBackgroundImage == UIImage(named: "btnInstall") {
            
           priceLabel.text = "0"
            
            UserDefaults.standard.set(priceLabel.text, forKey: "priceLabel")
        } */
        
        
    }
    @IBOutlet weak var buttonCellOutlet: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    
}

