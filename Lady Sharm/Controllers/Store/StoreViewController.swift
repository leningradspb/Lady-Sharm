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
        
        setupLabelsColorsAndText()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
        
        
    } // end of vieDidLoad
    
    
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
        
        return shopMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StoreCollectionViewCell
        
        cell.delegate = self
     
        cell.shopMenuModel = shopMenuArray[indexPath.row]
        
        let intPriceCellLabel = cell.priceLabel.text
        
        return cell
        
    }
    
}

extension StoreViewController: StoreCellDelegate {
    func didTapStoreCellWithId(productId: Int) {
        
        let storeManager = StoreManager()
        
        storeManager.handleProduct(productId: productId)
        
    }
}

extension StoreViewController {
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        
        if swipe.direction.rawValue == UISwipeGestureRecognizer.Direction.left.rawValue {
            performSegue(withIdentifier: "storeToSecondVC", sender: self)
        }
    }
}
