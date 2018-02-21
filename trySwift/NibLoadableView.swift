//
//  NibLoadableView.swift
//  trySwift
//
//  Created by Natasha Murashev on 9/20/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: NibLoadableView { }
