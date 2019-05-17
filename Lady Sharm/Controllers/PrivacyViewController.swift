//
//  PrivacyViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit
import WebKit

class PrivacyViewController: UIViewController {
    
    let webKitClass = WKWebView()
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://docs.google.com/document/d/1oEuNV6FfiwJvNxssgCFo3sPnQj5Y8JYulfmskZEMWCQ/edit")!
        
        let request = URLRequest(url: url)
        webView.load(request)
        view.addSubview(webView)
    }
    

   

}
