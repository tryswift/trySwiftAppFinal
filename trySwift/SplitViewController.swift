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
        delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SplitViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
