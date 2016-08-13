//
//  OrganizerDetailTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/13/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class OrganizerDetailTableViewController: UITableViewController {

    var organizer: Organizer!
    
    private enum OrganizerDetail: Int {
        case Header, Bio, Twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = organizer.name
        
        tableView.registerNib(UINib(nibName: String(OrganizerTableViewCell), bundle: nil), forCellReuseIdentifier: String(OrganizerTableViewCell))
        tableView.registerNib(UINib(nibName: String(TextTableViewCell), bundle: nil), forCellReuseIdentifier: String(TextTableViewCell))
        tableView.registerNib(UINib(nibName: String(TwitterFollowTableViewCell), bundle: nil), forCellReuseIdentifier: String(TwitterFollowTableViewCell))
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .None
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch OrganizerDetail(rawValue: indexPath.row)! {
        case .Header:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(OrganizerTableViewCell), forIndexPath: indexPath) as! OrganizerTableViewCell
            cell.configure(withOrganizer: organizer, selectionEnabled: false, accessoryEnabled: false)
            return cell
        case .Bio:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TextTableViewCell), forIndexPath: indexPath) as! TextTableViewCell
            cell.configure(withText: organizer.bio)
            return cell
        case .Twitter:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TwitterFollowTableViewCell), forIndexPath: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: organizer.twitter, delegate: self)
            return cell
        }
    }
    
}

extension OrganizerDetailTableViewController: TwitterFollowDelegate {
    
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
            let webViewController = WebDisplayViewController()
            webViewController.url = NSURL(string: "http://twitter.com/\(username)")!
            webViewController.displayTitle = "@\(username)"
            navigationController?.pushViewController(webViewController, animated: true)
        }
    }
}


