//
//  NYC2016Conferences.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public let nyc2019Conferences: [Conference] = [
    Conference(
        name: "try! Conference",
        twitter: "tryswiftnyc",
        logoAssetName: "Logo_NYC.png",
        conferenceDescription: "try! Swift Conference is an international community gathering about the latest advancements in Swift Development. The event is about bringing together talent from all around the world to collaborate and share advanced knowledge and techniques to improve Swift craftsmanship. Coming again to New York City on September 9th & 10th 2019, with workshops on September 8th!",
        conferenceDescriptionJP: nil,
        email: "nyc@tryswift.co",
        slackURL: "https://tryswiftnyc.slack.com/",
        slackTeamID: "",
        venues: [nyc2019Venues["new-world-stages"]!,
                 nyc2019Venues["frames-nyc"]!,
                 nyc2019Venues["swiftui-workshop"]!,
                 nyc2019Venues["combine-workshop"]!,
                 nyc2019Venues["websocket-workshop"]!,
                 nyc2019Venues["bosear-workshop"]!,
                 nyc2019Venues["pi-workshop"]!,
                 nyc2019Venues["fractal-workshop"]!,
                 nyc2019Venues["communication-workshop"]!,
                 nyc2019Venues["prototyping-workshop"]!,
                 ],
        organizers: nyc2019Organizers,
        emojiSet: "🐥🎉🗽",
        timezone: "EST",
        dateFormat: "h:mm a"
        )
]
