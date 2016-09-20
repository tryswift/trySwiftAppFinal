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
        return UIColor(hexString: "#B8322B")
    }
    
    static func trySwiftTitleColor() -> UIColor {
        return UIColor.trySwiftMainColor().lighter(amount: 0.1).desaturated()
    }
    
    static func trySwiftSubtitleColor() -> UIColor {
        return .darkGray
    }
    
    static func trySwiftAccentColor() -> UIColor {
        return UIColor(hexString: "#4FD5D6")
    }
    
    static func twitterBlue() -> UIColor {
        return UIColor(hexString: "#4FD5D6").darkened(amount: 0.1).desaturated()
    }
}
