//
//  UIColorExtension.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import DynamicColor

extension UIColor {
    
    static func trySwiftMainColor() -> UIColor {
        return UIColor(hexString: "#f0501d")
    }
    
    static func trySwiftTitleColor() -> UIColor {
        return UIColor.trySwiftMainColor().lighter(amount: 0.1).desaturated()
    }
    
    static func trySwiftSubtitleColor() -> UIColor {
        return .darkGray
    }
    
    static func trySwiftAccentColor() -> UIColor {
        return UIColor(hexString: "#ef551a")
    }
    
    static func twitterBlue() -> UIColor {
        return UIColor(hexString: "#ff5a00").darkened(amount: 0.1).desaturated()
    }
}
