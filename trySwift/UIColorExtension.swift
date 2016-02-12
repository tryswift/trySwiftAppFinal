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

    class func trySwiftMainColor() -> UIColor {
        return UIColor(hexString: "#B8322B")
    }
    
    class func trySwiftTitleColor() -> UIColor {
        return UIColor.trySwiftMainColor().lightenColor(0.1).desaturatedColor()
    }
    
    class func trySwiftSubtitleColor() -> UIColor {
        return UIColor.darkGrayColor()
    }
    
    class func trySwiftAccentColor() -> UIColor {
        return UIColor(hexString: "#4FD5D6")
    }
    
    class func twitterBlue() -> UIColor {
        return UIColor(hexString: "#4FD5D6").darkenColor(0.1).desaturatedColor()
        //return UIColor(hexString: "#4099FF")
    }
}
