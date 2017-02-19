//
//  UIImageExtension.swift
//  trySwift
//
//  Created by Tim Oliver on 2/19/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

extension UIImage {
    public class func trySwiftNavigationBarBackground() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 64), true, 0)

        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Color Declarations
        let top = UIColor(red: 0.918, green: 0.482, blue: 0.012, alpha: 1.000)
        let bottom = UIColor(red: 0.941, green: 0.306, blue: 0.118, alpha: 1.000)

        //// Gradient Declarations
        let gradient = CGGradient(colorsSpace: nil, colors: [bottom.cgColor, top.cgColor] as CFArray, locations: [0, 1])!

        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 64))
        context.saveGState()
        rectanglePath.addClip()
        context.drawLinearGradient(gradient, start: CGPoint(x: 0.5, y: 64), end: CGPoint(x: 0.5, y: 0), options: [])
        context.restoreGState()

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image!
    }
}
