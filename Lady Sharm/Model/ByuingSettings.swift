//
//  ByuingSettings.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 25/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation

class ByuingSettings {
    
    var isByuing = false {
        didSet {
            print("isByuing is: \(isByuing)")
            NotificationCenter.default.post(Notification(name: Notification.Name.ByuingSettingsDidChange, object: self))
            UserDefaults.standard.set(isByuing, forKey: "isByuing")
        }
    }
    
    var isInstalled = false {
        didSet {
            print("isByuing is: \(isInstalled)")
            NotificationCenter.default.post(Notification(name: Notification.Name.ByuingSettingsDidChange, object: self))
            UserDefaults.standard.set(isInstalled, forKey: "isInstalled")
        }
    }
    
    
    init() {
        
        if UserDefaults.standard.value(forKey: "isByuing") != nil {
            isByuing = UserDefaults.standard.bool(forKey: "isByuing")
        }
            if UserDefaults.standard.value(forKey: "isInstalled") != nil {
                isByuing = UserDefaults.standard.bool(forKey: "isInstalled")
            }
    
    } // end of init
    
}

extension Notification.Name {
    static let ByuingSettingsDidChange = Notification.Name("ByuingSettingsDidChange")
}
