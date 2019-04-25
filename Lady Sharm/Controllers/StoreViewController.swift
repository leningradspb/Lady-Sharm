//
//  StoreViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 24/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class StoreViewController: BasedTutorialViewController {
    
    // отвечает за очки
    var text = String()
    var scores = Scores()
    var isByu: ByuingSettings?
    
    //let arrayOfImages = [UIImage(named: "skin1"), UIImage(named: "skin2"), UIImage(named: "skin3")]
   // let arrayOfLabels = ["Стандарт", "Скин №1", "Скин №2"]
   // let arrayOfButtons = [UIImage(named: "btnBuy"), UIImage(named: "btnInstalled"), UIImage(named: "btnInstall")]
   // let arrayOfButtons = ["btnInstalled", "btnBuy", "btnBuy"]
    
    var shopMenuArray: [ShopMenu] = {
        var shopMenu = ShopMenu()
        shopMenu.itemName = "Стандарт"
        shopMenu.imageName = "skin1"
        shopMenu.buttonImageName = "btnInstalled"
        shopMenu.price = "0"
        
        
        var shopMenu2 = ShopMenu()
        shopMenu2.itemName = "Скин №1"
        shopMenu2.imageName = "skin2"
        shopMenu2.buttonImageName = "btnBuy"
        shopMenu2.price = "5000"
        
        var shopMenu3 = ShopMenu()
        shopMenu3.itemName = "Скин №2"
        shopMenu3.imageName = "skin3"
        shopMenu3.buttonImageName = "btnBuy"
        shopMenu3.price = "50000"
        
        
        return [shopMenu, shopMenu2, shopMenu3]
    }()

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var pointsLabelStore: UILabel!
    @IBOutlet weak var themsLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        
        
       // UserDefaults.standard.object(forKey: "priceLabelText") ?? "5000"
        
       setupLabelsColorsAndText()
        
    } // end of vieDidLoad
    

    
    
    
    func setupLabelsColorsAndText() {
        themsLabel.textColor        = .white
        storeLabel.textColor        = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        pointsLabelStore.textColor  = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        
        // MARK: Text labels
        pointsLabelStore.text = text
       // let stringScore = String(scores.score)
        
        
    }
    
}


extension StoreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return shopMenuArray.count
        
        return shopMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StoreCollectionViewCell
     
        
       // cell.imageViewCell.image = UIImage(named: "bg2Sm")
      //  cell.index(ofAccessibilityElement: self)
       // cell.imageViewCell.image = arrayOfImages[indexPath.row]
       // cell.descriptionLabel.text = arrayOfLabels[indexPath.row]
       //cell.buttonCellOutlet.setBackgroundImage(UIImage(named: arrayOfButtons[indexPath.row]), for: .normal)
        
        cell.shopMenuModel = shopMenuArray[indexPath.row]
        
        let intPriceCellLabel = cell.priceLabel.text
        
       if (Int(text)! < (Int(intPriceCellLabel!)!)) && (cell.buttonCellOutlet.currentBackgroundImage == UIImage(named: "btnBuy")) {
            cell.buttonCellOutlet.isEnabled = false
            
            // MARK: Прописать алерт контроллер, убрать недоступность
        }
        
        return cell
        
    }
    
}
