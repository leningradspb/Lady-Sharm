//
//  StoreSecondVC.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 17/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class StoreSecondVC: BasedTutorialViewController {
    
    var newPoints = 0
    //MARK: Общие очки
    @IBOutlet weak var mainPointsLabel: UILabel!
    var text = String()
    
    var shopMenuArray: [Product] = ProductProvider.getThemeProducts()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupLabelsColorsAndText()
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        right.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(right)
        
        mainPointsLabel.text = text
        
        createObserversToLabel()
       
    }
    
    func setupLabelsColorsAndText() {
        //themsLabel.textColor        = .white
        label.textColor        = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
       // pointsLabelStore.textColor  = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        mainPointsLabel.textColor        = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
    }
    
    
    
    //MARK: - OBSERVERS for update POINTS.
    func createObserversToLabel() {
        
        print("I added observers")
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: imageDidChanged), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: imageDidChangedFromSecondID), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: imagelDidChangedFromThirdID), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: labelDidChanged), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: labelDidChangedFromSecondID), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointsLabel(notification:)), name: Notification.Name(rawValue: labelDidChangedFromThirdID), object: nil)
        
    }

    
    @objc func updatePointsLabel(notification: NSNotification) {
        print("I have caught notification")
        // ПОМЕНЯТЬ НА imageDidiChange если не будет работать
        if notification.name == Notification.Name(rawValue: labelDidChanged) {
            //MARK: - Изменение отутлеt кнопки в ячейке
        } else if notification.name == Notification.Name(rawValue: labelDidChangedFromSecondID) {
            
            newPoints = Int(text)! - 5000
            text = String(newPoints)
            mainPointsLabel.text = text
            performSegue(withIdentifier: "themePurchased", sender: self)
        } else if notification.name == Notification.Name(rawValue: labelDidChangedFromThirdID) {
            newPoints = Int(text)! - 5000
            text = String(newPoints)
            mainPointsLabel.text = text
            performSegue(withIdentifier: "themePurchased", sender: self)
        }
        
    }


}
extension StoreSecondVC {
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        
        if swipe.direction.rawValue == UISwipeGestureRecognizer.Direction.right.rawValue {
            performSegue(withIdentifier: "secondToStoreVC", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondToStoreVC" {
            let dvc = segue.destination as! StoreViewController
            dvc.text = text
        }
    }
}
// secondToStoreVC

extension StoreSecondVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SecondVCStoreCell
        
        cell.delegate = self
        
        
        //MARK: передача информации в ячейку SecondVCStoreCell
        cell.shopMenuModel = shopMenuArray[indexPath.row]
        
        
        //MARK: ПОСЛЕ ЭТОГО НУЖНО ОБЯЗАТЕЛЬНО СДЕЛАТЬ self.collectionView.reloadData() in didTapStoreCellWithId(productId: Int)
        if(PurchasedProductsManager().checkIfProductPurchased(product: cell.shopMenuModel!)) {
            //if already bought
            
            if(ThemeStyleSingleton.shared.getCurrentThemeSkin().id == shopMenuArray[indexPath.row].id) {
                
                //if already set
                cell.storeBO.setBackgroundImage(UIImage(named: "btnInstalled"), for: .normal)
             
            } else {
                //if not set
                    cell.storeBO.setBackgroundImage(UIImage(named: "btnInstall"), for: .normal)
                }
        } else {
            //if if not bought
            cell.storeBO.setBackgroundImage(UIImage(named: "btnBuy"), for: .normal)
            

        }
        
        
        
        return cell
    }
    
}

extension StoreSecondVC: StoreCellDelegate {
    func didTapStoreCellWithId(productId: Int) {
        
        let storeManager = StoreManager()
        
        storeManager.handleProduct(productId: productId)
        
        //MARK: - Если что-то пойдет не так с секонд вью контроллером, то раскоментить
        /*
 if Scores().getScores() >= 5000 {
 
 let name4 = Notification.Name(rawValue: fourthThemeIsSelectedKey)
 let name5 = Notification.Name(rawValue: fifthThemeIsSelectedKey)
 let name6 = Notification.Name(rawValue: sixthThemeIsSelectedKey)
 //                let name4 = Notification.Name(rawValue: imageDidChanged)
 //                let name5 = Notification.Name(rawValue: imageDidChangedFromSecondID)
 //                let name6 = Notification.Name(rawValue: imagelDidChangedFromThirdID)
 
 if productId == 4 {
 print("I have posted notification")
 NotificationCenter.default.post(name: name4, object: nil)
 NotificationCenter.default.post(name: Notification.Name(rawValue: imageDidChanged), object: nil)
 } else if productId == 5 {
 NotificationCenter.default.post(name: name5, object: nil)
 NotificationCenter.default.post(name: Notification.Name(rawValue: imageDidChangedFromSecondID), object: nil)
 } else if productId == 6 {
 NotificationCenter.default.post(name: name6, object: nil)
 NotificationCenter.default.post(name: Notification.Name(rawValue: imagelDidChangedFromThirdID), object: nil)
 } */
      
        
        self.collectionView.reloadData()
    }
}
