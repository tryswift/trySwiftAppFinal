//
//  BLR2017Conferences.swift
//  TrySwiftData_Tests
//
//  Created by Natasha Murashev on 2/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

// Check the commented statement is correct or not

public let tko2018Conferences: [Conference] = [
{
    let trySwift = Conference()
    trySwift.name = "try! Conference"
    trySwift.twitter = "tryswiftconf"
    trySwift.email = "tokyo@tryswift.co"
    trySwift.slackURL = "https://tryswifttokyo2018.slack.com"
    trySwift.logoAssetName = "Logo_TKO.png"
    trySwift.conferenceDescription = "try! Swift is the biggest international iOS developer conference in the world focusing on the new Swift Programming Language. try! Swift Tokyo is an amazing chance for developers from around the world to learn the latest world trends in iOS development using the industry's best standards. Learn from 21 international speakers, engage with the community. Coming to Tokyo on March 1st and 2nd, with Peer Labs and Workshops on March 3rd."
    
    tko2018Venues.forEach { trySwift.venues.append($1) }
    tko2018Organizers.forEach { trySwift.organizers.append($1) }
    
    return trySwift
    }()
]

