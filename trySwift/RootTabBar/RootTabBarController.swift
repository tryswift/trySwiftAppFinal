//
//  RootTabBarController.swift
//  trySwift
//
//  Created by Sash Zats on 3/2/18.
//  Copyright © 2018 NatashaTheRobot. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController, UITabBarControllerDelegate {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
  }

  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    if let splitViewController = viewController as? UISplitViewController {
      if let navigationController = splitViewController.viewControllers.last as? UINavigationController,
        navigationController.viewControllers.count > 1 {
        navigationController.popViewController(animated: true)
      }
    }
  }
}
