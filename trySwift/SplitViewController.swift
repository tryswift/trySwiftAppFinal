//
//  SplitViewController.swift
//  trySwift
//
//  Created by Bas Broek on 23/03/2017.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredDisplayMode = .allVisible
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
