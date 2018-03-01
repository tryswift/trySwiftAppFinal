//
//  TwitterFollowDelegate.swift
//  trySwift
//
//  Created by Sash Zats on 3/2/18.
//  Copyright © 2018 NatashaTheRobot. All rights reserved.
//

import UIKit

protocol TwitterFollowDelegate: class {
    func followUser(_ username: String)
}

extension UIViewController: TwitterFollowDelegate {

    func followUser(_ username: String) {
        var applicationOpened = false
        let application = UIApplication.shared
        for twitterURL in Twitter.urls(forUsername: username) {
            if let url = URL(string: twitterURL) , application.canOpenURL(url) && !applicationOpened {
                application.open(url, options: [String:Any](), completionHandler: nil)
                applicationOpened = true
                break
            }
        }

        if !applicationOpened {
            if let twitterURL = URL(string: "https://twitter.com/\(username)") {
                openSafariViewController(withURL: twitterURL)
            }
        }
    }
}

