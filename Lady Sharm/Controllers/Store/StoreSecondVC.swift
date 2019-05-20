//
//  StoreSecondVC.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 17/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class StoreSecondVC: BasedTutorialViewController {
    
   
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
       
    }
    
    func setupLabelsColorsAndText() {
        //themsLabel.textColor        = .white
        label.textColor        = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
       // pointsLabelStore.textColor  = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        
    }


}
extension StoreSecondVC {
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        
        if swipe.direction.rawValue == UISwipeGestureRecognizer.Direction.right.rawValue {
            performSegue(withIdentifier: "secondToStoreVC", sender: self)
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
        
        return cell
    }
    
    
}

extension StoreSecondVC: StoreCellDelegate {
    func didTapStoreCellWithId(productId: Int) {
        
        let storeManager = StoreManager()
        
        storeManager.handleProduct(productId: productId)
        
    }
}
