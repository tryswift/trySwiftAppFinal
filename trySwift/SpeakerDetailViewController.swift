//
//  SpeakerDetailViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class SpeakerDetailViewController: UITableViewController {

    var speaker: Speaker!
    
    private enum SpeakerDetail: Int {
        case Header, Bio, Twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = speaker.name
        
        tableView.registerNib(UINib(nibName: String(SpeakerTableViewCell), bundle: nil), forCellReuseIdentifier: String(SpeakerTableViewCell))
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
        switch SpeakerDetail(rawValue: indexPath.row)! {
        case .Header:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(SpeakerTableViewCell), forIndexPath: indexPath) as! SpeakerTableViewCell
            cell.configure(withSpeaker: speaker, selectionEnabled: false, accessoryEnabled: false)
            return cell
        case .Bio:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TextTableViewCell), forIndexPath: indexPath) as! TextTableViewCell
            cell.configure(withText: speaker.bio)
            return cell
        case .Twitter:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TwitterFollowTableViewCell), forIndexPath: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: speaker.twitter, delegate: self)
            return cell
        }
    }

}

extension SpeakerDetailViewController: TwitterFollowDelegate {
    
    func followUser(username: String) {
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
    }
}
