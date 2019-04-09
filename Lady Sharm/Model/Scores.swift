//
//  Scores.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 07/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation

class Scores {
    private(set) var score: Int = 0 {
        didSet {
            UserDefaults.standard.set(score, forKey: "Score")
            }
    }
}
