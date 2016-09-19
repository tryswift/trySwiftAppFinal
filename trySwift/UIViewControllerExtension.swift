//
//  UIViewControllerExtension.swift
//  trySwift
//
//  Created by Bas Broek on 4/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import SafariServices

extension UIViewController: SFSafariViewControllerDelegate {
    
    func openSafariViewController(withURL url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        present(safariViewController, animated: true, completion: nil)
    }
    
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
}

extension UIViewController: TwitterFollowDelegate {
    
    func followUser(_ username: String) {
        var applicationOpened = false
        let application = UIApplication.shared
        for twitterURL in Twitter.urls(forUsername: username) {
            if let url = URL(string: twitterURL) , application.canOpenURL(url) && !applicationOpened {
                application.openURL(url)
                applicationOpened = true
                break
            }
        }
        
        if !applicationOpened {
            if let twitterURL = URL(string: "http://twitter.com/\(username)") {
                openSafariViewController(withURL: twitterURL)
            }
        }
    }
}
