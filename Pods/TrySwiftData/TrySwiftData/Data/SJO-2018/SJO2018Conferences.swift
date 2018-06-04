//
//  BLR2017Conferences.swift
//  TrySwiftData_Tests
//
//  Created by Natasha Murashev on 2/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

// Check the commented statement is correct or not

public let sjo2018Conferences: [Conference] = [
    Conference(
        name: "try! Conference",
        twitter: "tryswiftsanjose",
        logoAssetName: "Logo_SJO.png",
        conferenceDescription: "try! Swift San Jose is your chance to contribute to Swift. Join a panel of Swift Open Source contributors for a discussion about the latest news on the Swift open source project, then contribute to Swift Evolution yourself with the help of community mentors! Happening on Friday, June 8th at the Hilton connected to the San Jose McEnery Convention Center at WWDC.",
        conferenceDescriptionJP: nil,
        email: "sanjose@tryswift.co",
        slackURL: "https://tryswiftsanjose2018.slack.com/",
        venues: sjo2018Venues.map { $1 },
        organizers: sjo2018Organizers.map { $1 }
    )
]

