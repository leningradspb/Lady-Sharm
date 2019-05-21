//
//  SecondVCStoreCell.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 17/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

//MARK: - notification keys
let firstThemeIsSelectedKey = "firstThemeIsSelected"
let secondThemeIsSelectedKey = "secondThemeIsSelected"
let thirdThemeIsSelectedKey = "thirdThemeIsSelected"

class SecondVCStoreCell: UICollectionViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBAction func storeBA(_ sender: UIButton) {
    }
    @IBOutlet weak var storeBO: UIButton!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var themeLabel: UILabel!
    
  
    
    var delegate: StoreCellDelegate!
    
    var shopMenuModel: Product? {
        didSet {
            itemName.text     = shopMenuModel?.itemName
            priceLabel.text           = shopMenuModel?.price
            if let image              = shopMenuModel?.imageName {
                imageCell.image   = UIImage(named: image)
            }
            if let imageButton = shopMenuModel?.buttonImageName {
                storeBO.setBackgroundImage(UIImage(named: imageButton), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        
        themeLabel.textColor = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        
       
    }
    
    @IBAction func buttonCellAction(_ sender: UIButton) {
        
        
        self.delegate.didTapStoreCellWithId(productId: (shopMenuModel?.id)!)
        
//        if shopMenuModel?.id == 5 && (Int(priceLabel.text!)!) == 5000 {
//            
//            
//            priceLabel.text = "0"
//            storeBO.setBackgroundImage(UIImage(named: "btnInstalled"), for: .normal)
//            
//        } else if shopMenuModel?.id == 5 && (Int(priceLabel.text!)!) == 0 {
//            storeBO.setBackgroundImage(UIImage(named: "btnInstalled"), for: .normal)
//            
//        }
        
        
        
    }// конец кнопки
    
    
}

