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

        // Do any additional setup after loading the view.
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
