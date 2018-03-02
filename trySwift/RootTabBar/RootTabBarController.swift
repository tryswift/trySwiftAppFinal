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
      if let navigationController = splitViewController.viewControllers.last as? UINavigationController {
        if navigationController.viewControllers.count > 1 {
          navigationController.popViewController(animated: true)
        } else {
          navigationController.viewControllers.first?.scrollToTop()
        }
      }
    }
  }
}

private extension UIViewController {
  func scrollToTop() {
    let scrollView = view.findScrollSubview()
    scrollView?.setContentOffset(.zero, animated: true)
  }
}

private extension UIView {
  func findScrollSubview() -> UIScrollView? {
    if let scrollView = self as? UIScrollView,
      scrollView.contentSize.width < scrollView.contentSize.height {
      return scrollView
    }
    for subview in self.subviews {
      if let scrollView = subview.findScrollSubview(),
        scrollView.contentSize.width < scrollView.contentSize.height {
        return scrollView
      }
    }
    return nil
  }
}
