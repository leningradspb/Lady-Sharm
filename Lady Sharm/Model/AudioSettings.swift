//
//  Settings.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation

class AudioSettings {
    
    var isSoundOn = true {
        didSet {
            NotificationCenter.default.post(Notification(name: Notification.Name.AudioSettingsDidChange))
        }
    }
    var isMusicOn = true {
        didSet {
            print("music changed")
            NotificationCenter.default.post(name: Notification.Name.AudioSettingsDidChange, object: self)
            UserDefaults.standard.set(isMusicOn, forKey: "isMusicOn")
        }
    }
    
    init() {
        if UserDefaults.standard.value(forKey: "isMusicOn") != nil {
            isMusicOn = UserDefaults.standard.bool(forKey: "isMusicOn")
        }
    }
    
}

extension Notification.Name {
    static let AudioSettingsDidChange = Notification.Name("AudioSettingsDidChange")
}
