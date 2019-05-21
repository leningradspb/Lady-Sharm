//
//  StoreCollectionViewCell.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 24/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit


protocol StoreCellDelegate {
    
    func didTapStoreCellWithId(productId: Int) -> Void
}

//MARK: - notification keys
let labelDidChanged = "labelDidChanged"
let labelDidChangedFromSecondID = "labelDidChangedFromSecondID"
let labelDidChangedFromThirdID = "labelDidChangedFromThirdID"


class StoreCollectionViewCell: UICollectionViewCell {
    
    
    var vcPoints = ViewController()
    var priceOfIcon = 500
    var text = String()
    
    var delegate: StoreCellDelegate!
    
    var shopMenuModel: Product? {
        didSet {
            descriptionLabel.text     = shopMenuModel?.itemName
            priceLabel.text           = shopMenuModel?.price
            if let image              = shopMenuModel?.imageName {
                imageViewCell.image   = UIImage(named: image)
            }
            if let imageButton = shopMenuModel?.buttonImageName {
                buttonCellOutlet.setBackgroundImage(UIImage(named: imageButton), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        
      //  buyingSettings.isInstalled = false
       // buyingSettings.isByuing = false
        
        if UserDefaults.standard.object(forKey: "priceLabel.text") != nil {
        UserDefaults.standard.object(forKey: "priceLabel.text")
        
        } else  {
            priceLabel.text = "5000"
        }
        if UserDefaults.standard.object(forKey: "imageButton") != nil {
            UserDefaults.standard.object(forKey: "imageButton")
        }
    }
    
    @IBAction func buttonCellAction(_ sender: UIButton) {
        
        self.delegate.didTapStoreCellWithId(productId: (shopMenuModel?.id)!)
        
        
        if shopMenuModel?.id == 2 && (Int(priceLabel.text!)!) == 5000 {
            
            
//            priceLabel.text = "0"
//            buttonCellOutlet.setBackgroundImage(UIImage(named: "btnInstalled"), for: .normal)
//            
//        } else if shopMenuModel?.id == 5 && (Int(priceLabel.text!)!) == 0 {
//            buttonCellOutlet.setBackgroundImage(UIImage(named: "btnInstalled"), for: .normal)
            
            
               // buttonCellOutlet.setBackgroundImage(UIImage(named: "btnInstall"), for: .normal)
              
        }
        
      
        
    }// конец кнопки
    
    @IBOutlet weak var buttonCellOutlet: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    
}

