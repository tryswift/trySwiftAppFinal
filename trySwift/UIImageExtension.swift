//
//  UIImageExtension.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan

extension UIImage {
    
    @nonobjc static let trySwiftDefaultImage = Toucan(image: UIImage(named: "tryLogo")!).maskWithEllipse().image
}
