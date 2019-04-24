//
//  StoreCollectionViewCell.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 24/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    @IBAction func buttonCellAction(_ sender: UIButton) {
    }
    @IBOutlet weak var buttonCellOutlet: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
}
