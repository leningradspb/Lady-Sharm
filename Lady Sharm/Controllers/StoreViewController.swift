//
//  StoreViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 24/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class StoreViewController: BasedTutorialViewController {
    
    var fPointsInt = 0
    
    // отвечает за очки
    var text    = String()
    var scores  = Scores()
    var isByu: ByuingSettings?
    
    
    var shopMenuArray: [Product] = ProductProvider.getProducts()

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var pointsLabelStore: UILabel!
    @IBOutlet weak var themsLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self

       // fBO.setBackgroundImage(UIImage(named: "btnByu"), for: .normal)
        
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
        
        cell.delegate = self
     
        
       // cell.imageViewCell.image = UIImage(named: "bg2Sm")
      //  cell.index(ofAccessibilityElement: self)
       // cell.imageViewCell.image = arrayOfImages[indexPath.row]
       // cell.descriptionLabel.text = arrayOfLabels[indexPath.row]
       //cell.buttonCellOutlet.setBackgroundImage(UIImage(named: arrayOfButtons[indexPath.row]), for: .normal)
        
        cell.shopMenuModel = shopMenuArray[indexPath.row]
        
        let intPriceCellLabel = cell.priceLabel.text
        

     /*  if (Int(text)! < (Int(cell.priceLabel.text!)!)) && (cell.buttonCellOutlet.currentBackgroundImage == UIImage(named: "btnBuy")) {
            cell.buttonCellOutlet.isEnabled = false
        
            // MARK: Прописать алерт контроллер, убрать недоступность
        } */
        
        /*  if ((Int(intPriceCellLabel!)!) <= Int(text)!) && Int(intPriceCellLabel!) != 0 {
          //  text = String(Int(pointsLabelStore.text!)! - 5000)
           // pointsLabelStore.text = text
        } */
        
     //   cell.buttonCellAction(cell.buttonCellOutlet)
        
        return cell
        
    }
    
}

extension StoreViewController: StoreCellDelegate {
    func didTapStoreCellWithId(productId: Int) {
        
        let storeManager = StoreManager()
        
        storeManager.handleProduct(productId: productId)
        
    }
}
