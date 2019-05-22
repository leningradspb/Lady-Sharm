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
    
    var newPoints = 0
    
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
        
        setupLabelsColorsAndText()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
        
        createObserversToLabel()
        
      //  text = "500000"
        
    } // end of vieDidLoad
    
    
    func setupLabelsColorsAndText() {
        themsLabel.textColor        = .white
        storeLabel.textColor        = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        pointsLabelStore.textColor  = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        
        // MARK: Text labels
        pointsLabelStore.text = text
        
    }
    
    
    //MARK: - OBSERVERS for update POINTS.
    func createObserversToLabel() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: labelDidChanged), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: labelDidChangedFromSecondID), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: labelDidChangedFromThirdID), object: nil)
        
    }
    
    @objc func updatePointsLabel(notification: NSNotification) {
        
        if notification.name == Notification.Name(rawValue: labelDidChanged) {
            //TODO: Изменить отутлек кнопки в ячейке
        } else if notification.name == Notification.Name(rawValue: labelDidChangedFromSecondID) {
            newPoints = Int(text)! - 5000
            text = String(newPoints)
            pointsLabelStore.text = text
            // MARK: Show popover
            performSegue(withIdentifier: "skinPurchased", sender: self)

        } else if notification.name == Notification.Name(rawValue: labelDidChangedFromThirdID) {
            newPoints = Int(text)! - 5000
            text = String(newPoints)
            pointsLabelStore.text = text
            // MARK: Show popover
            performSegue(withIdentifier: "skinPurchased", sender: self)
        }
        
    }
    
    
    
    
}// endOfClass


 extension StoreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shopMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StoreCollectionViewCell
        
        cell.delegate = self
     
        cell.shopMenuModel = shopMenuArray[indexPath.row]
        
        //set buttons
        if(PurchasedProductsManager().checkIfProductPurchased(product: cell.shopMenuModel!)) {
            //if already bought
            
            if(CardStyleSingleton.shared.getCurrentCardSkin().id == shopMenuArray[indexPath.row].id) {
                //if already set
                cell.buttonCellOutlet.setBackgroundImage(UIImage(named: "btnInstalled"), for: .normal)
            } else {
                //if not set
                cell.buttonCellOutlet.setBackgroundImage(UIImage(named: "btnInstall"), for: .normal)
            }
            
        } else {
            //if if not bought
            cell.buttonCellOutlet.setBackgroundImage(UIImage(named: "btnBuy"), for: .normal)
        }
        
        
//        let intPriceCellLabel = cell.priceLabel.text
        
        return cell
        
    }
    
}

extension StoreViewController: StoreCellDelegate {
    func didTapStoreCellWithId(productId: Int) {
        
        let storeManager = StoreManager()
        
        storeManager.handleProduct(productId: productId)
        
        
        
        self.collectionViewOutlet.reloadData()
        
    }
}

extension StoreViewController {
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        
        if swipe.direction.rawValue == UISwipeGestureRecognizer.Direction.left.rawValue {
            performSegue(withIdentifier: "storeToSecondVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "storeToSecondVC" {
            let dvc = segue.destination as! StoreSecondVC
            dvc.text = text
        }
    }
}
