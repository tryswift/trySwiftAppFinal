//
//  NYC2016Conferences.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public let nyc2018Conferences: [Conference] = [
    Conference(
        name: "try! NYC",
        twitter: "tryswiftnyc",
        logoAssetName: "Logo_NYC.png",
        conferenceDescription: "try! Conference is an international community gathering about the latest advancements in Swift Development. The event is about bringing together talent from all around the world to collaborate and share advanced knowledge and techniques to improve Swift craftsmanship. Coming again to New York City on September 4th & 5th 2018, with workshops happening on September 3rd!",
        conferenceDescriptionJP: nil,
        email: "nyc@tryswift.co",
        slackURL: "https://tryswiftnyc2018.slack.com/",
        slackTeamID: "T9Y0ZDK0S",
        venues: [nyc2018Venues["newworldstages"]!, nyc2018Venues["frames"]!],
        organizers: nyc2018Organizers,
        emojiSet: "🐥🎉🗽",
        timezone: "EST",
        dateFormat: "h:mm a"
        )
]
