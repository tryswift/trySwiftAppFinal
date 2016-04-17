//
//  AboutTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {

    private let trySwift = Organizer.trySwift
    
    private enum AboutInfo: Int {
        case Header, Detail, Twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = isJapanese ? "try! Conferenceについて" : "About"
        
        tableView.registerNib(UINib(nibName: String(OrganizerTableViewCell), bundle: nil), forCellReuseIdentifier: String(OrganizerTableViewCell))
        tableView.registerNib(UINib(nibName: String(TextTableViewCell), bundle: nil), forCellReuseIdentifier: String(TextTableViewCell))
        tableView.registerNib(UINib(nibName: String(TwitterFollowTableViewCell), bundle: nil), forCellReuseIdentifier: String(TwitterFollowTableViewCell))
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
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
        switch AboutInfo(rawValue: indexPath.row)! {
        case .Header:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(OrganizerTableViewCell), forIndexPath: indexPath) as! OrganizerTableViewCell
            cell.configure(withOrganizer: trySwift)
            cell.selectionStyle = .None
            cell.accessoryType = .None
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TextTableViewCell), forIndexPath: indexPath) as! TextTableViewCell
            cell.configure(withText: isJapanese ? "try! Conferenceは世界中のSwiftデベロッパーが一堂に会し、知識や技術を互いに共有し高め合うことを目的としたカンファレンスです。2016.3.2〜2016.3.4の三日間、東京・渋谷にて新たな出会いと学びの機会を、素晴らしい食事とともにお待ちしています。" : "try! Conference is an immersive community gathering about iOS, WatchOS, and tvOS development in Swift happening in Tokyo, Japan on March 2nd - 4th, 2016. The event is about bringing together talent from all around the world to collaborate and share advanced knowledge and techniques to improve our craft.")
            return cell
        case .Twitter:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TwitterFollowTableViewCell), forIndexPath: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: trySwift.twitter, delegate: self)
            return cell
        }
    }
    
}

extension AboutTableViewController: TwitterFollowDelegate {
    
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
            if let twitterURL = NSURL(string: "http://twitter.com/\(username)") {
                openSafariViewController(withURL: twitterURL)
            }
        }
    }
}

