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
        
        return cell
    }
    
    
}
