//
//  Scores.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 07/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation

class Scores {
    var score: Int = 0 {
        didSet {
            NotificationCenter.default.post(Notification(name: Notification.Name.ScoreDidChange, object: self))
            UserDefaults.standard.set(score, forKey: "Score")
            }
    }

}

extension Notification.Name {
    static let ScoreDidChange = Notification.Name("ScoreDidChange")
}
