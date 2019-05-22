//
//  ThemePurchasedVC.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 22/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class ThemePurchasedVC: UIViewController {

    @IBOutlet weak var viewOutlet: UIView!
    @IBAction func BA(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewOutlet.layer.cornerRadius = 20
        viewOutlet.layer.borderWidth = 3
        viewOutlet.clipsToBounds = true
        viewOutlet.layer.borderColor = UIColor(red: 196/255, green: 152/255, blue: 3/255, alpha: 1).cgColor
        label.textColor = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
