//
//  OrganizersTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class OrganizersTableViewController: UITableViewController {

    private let organizers = Organizer.organizers
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = isJapanese ? "主催者" : "Organizers"
        
        tableView.registerNib(UINib(nibName: String(OrganizerTableViewCell), bundle: nil), forCellReuseIdentifier: String(OrganizerTableViewCell))
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(OrganizerTableViewCell), forIndexPath: indexPath) as! OrganizerTableViewCell
        
        cell.configure(withOrganizer: organizers[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let organizer = organizers[indexPath.row]
        let username = organizer.twitter
        
        let twitterURLs = [
            "twitter://user?screen_name=\(username)", // Twitter
            "tweetbot://user_profile/\(username)", // TweetBot
            "echofon://user_timeline?\(username)", // Echofon
            "twit://user?screen_name=\(username)", // Twittelator Pro
            "x-seesmic://twitter_profile?twitter_screen_name=\(username)", // Seesmic
            "x-birdfeed://user?screen_name=\(username)", // Birdfeed
            "tweetings://user?screen_name=\(username)", // Tweetings
            "simplytweet://?link=http://twitter.com/\(username)", // SimplyTweet
            "icebird://user?screen_name=\(username)", // IceBird
            "fluttr://user/\(username)", // Fluttr
        ]
        
        var applicationOpened: Bool = false
        let application = UIApplication.sharedApplication()
        for twitterURL in twitterURLs {
            if let url = NSURL(string: twitterURL) where application.canOpenURL(url) && !applicationOpened {
                application.openURL(url)
                applicationOpened = true
                break
            }
        }
        
        if !applicationOpened {
            let webViewController = WebDisplayViewController()
            webViewController.url = NSURL(string: "http://twitter.com/\(username)")!
            webViewController.displayTitle = "@\(username)"
            navigationController?.pushViewController(webViewController, animated: true)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
