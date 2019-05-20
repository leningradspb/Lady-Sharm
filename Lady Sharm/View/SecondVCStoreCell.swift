//
//  SecondVCStoreCell.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 17/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit


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
        
        
//        let name        = Notification.Name(rawValue: keyOne)
//
//
//        NotificationCenter.default.post(name: name, object: nil)
//        UserDefaults.standard.set(keyForBasedController, forKey: keyForBasedController)
      
        
        // MARK: ИСПРАВИТЬ
        self.delegate.didTapStoreCellWithId(productId: (shopMenuModel?.id)!)
        
        
        
        
    }// конец кнопки
    
    
}

