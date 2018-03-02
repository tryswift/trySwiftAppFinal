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
    guard
      let splitViewController = viewController as? UISplitViewController,
      let navigationController = splitViewController.viewControllers.last as? UINavigationController
      else {
        return
    }

    // if several view controllers are in the stack, pop to the root
    if navigationController.viewControllers.count > 1 {
      navigationController.popToRootViewController(animated: true)
    } else {
      // if there's at least one view controller in the stack (which there always should be)
      if let firstController = navigationController.viewControllers.first {
        // we either delegate to the controller since it knows better how to scroll to the top
        if let scrollableToTop = firstController as? ScrollableToTop {
          scrollableToTop.scrollAfterTabTap()
        // or we find the topmost scroll view and scroll it to the top
        } else {
          firstController.view.findScrollSubview()?.setContentOffset(.zero, animated: true)
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
