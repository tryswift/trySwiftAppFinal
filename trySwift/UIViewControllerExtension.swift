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
    
    func openSafariViewController(withURL url: NSURL) {
        let safariViewController = SFSafariViewController(URL: url)
        safariViewController.delegate = self
        presentViewController(safariViewController, animated: true, completion: nil)
    }
    
    public func safariViewControllerDidFinish(controller: SFSafariViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension UIViewController: TwitterFollowDelegate {
    
    func followUser(username: String) {
        var applicationOpened = false
        let application = UIApplication.sharedApplication()
        for twitterURL in Twitter.urls(forUsername: username) {
            if let url = NSURL(string: twitterURL) where application.canOpenURL(url) && !applicationOpened {
                application.openURL(url)
                applicationOpened = true
                break
            }
        }
        
        if !applicationOpened {
            if let twitterURL = NSURL(string: "http://twitter.com/\(username)") {
                openSafariViewController(withURL: twitterURL)
            }
        }
    }
}
