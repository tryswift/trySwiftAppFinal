//
//  Twitter.swift
//  trySwift
//
//  Created by Bas Broek on 6/6/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation

// This is an enum, which prevents it from being instantiated.
// See https://www.natashatherobot.com/swift-enum-no-cases/
enum Twitter {
    
    static func urls(forUsername username: String) -> [String] {
        return [
            "twitter://user?screen_name=\(username)", // Twitter
            "tweetbot://\(username)/user_profile/\(username)", // TweetBot
            "echofon://user_timeline?\(username)", // Echofon
            "twit://user?screen_name=\(username)", // Twittelator Pro
            "x-seesmic://twitter_profile?twitter_screen_name=\(username)", // Seesmic
            "x-birdfeed://user?screen_name=\(username)", // Birdfeed
            "tweetings://user?screen_name=\(username)", // Tweetings
            "simplytweet://?link=http://twitter.com/\(username)", // SimplyTweet
            "icebird://user?screen_name=\(username)", // IceBird
            "fluttr://user/\(username)", // Fluttr
        ]
    }
}
