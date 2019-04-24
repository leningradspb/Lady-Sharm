//
//  StoreViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 24/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class StoreViewController: BasedTutorialViewController {
    
    var text = String()
    
    let arrayOfImages = [UIImage(named: "skin1"), UIImage(named: "skin2"), UIImage(named: "skin3")]
    let arrayOfLabels = ["Стандарт", "Дивный лес", "Летающий остров"]
   // let arrayOfButtons = [UIImage(named: "btnBuy"), UIImage(named: "btnInstalled"), UIImage(named: "btnInstall")]
    let arrayOfButtons = ["btnInstalled", "btnBuy", "btnBuy"]

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var pointsLabelStore: UILabel!
    @IBOutlet weak var themsLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        
       setupLabelsColorsAndText()
        
    }
    
    
    
    func setupLabelsColorsAndText() {
        themsLabel.textColor        = .white
        storeLabel.textColor        = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        pointsLabelStore.textColor  = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        
        // MARK: Text labels
        pointsLabelStore.text = text
        
    }
    
}


extension StoreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StoreCollectionViewCell
        
       // cell.imageViewCell.image = UIImage(named: "bg2Sm")
      //  cell.index(ofAccessibilityElement: self)
        cell.imageViewCell.image = arrayOfImages[indexPath.row]
        cell.descriptionLabel.text = arrayOfLabels[indexPath.row]
        cell.buttonCellOutlet.setBackgroundImage(UIImage(named: arrayOfButtons[indexPath.row]), for: .normal)
        
        return cell
    }
    
}
