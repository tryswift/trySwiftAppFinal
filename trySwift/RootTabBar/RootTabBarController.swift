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
          if let firstController = navigationController.viewControllers.first {
            if let scrollableToTop = firstController as? ScrollableToTop {
              scrollableToTop.scrollAfterTabTap()
            } else {
              firstController.view.findScrollSubview()?.setContentOffset(.zero, animated: true)
            }
          }
        }
      }
    }
  }
}

protocol ScrollableToTop {
  func scrollAfterTabTap()
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
