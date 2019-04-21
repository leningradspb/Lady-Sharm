//
//  UIButtonExtention.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 21/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.8
        pulse.fromValue = 0.9
        pulse.toValue = 1.2
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.2
        pulse.damping = 1
        
        layer.add(pulse, forKey: nil)
    }
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        
        
        layer.add(flash, forKey: nil)
        
    }
    
    
}
