//
//  NYC2016Sessions.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let sjo2018Sessions: [String : Session] = [
//---------------------------------------------------------
    // Day 1 Sessions
    "day1MorningRegistration" : Session(
        type: .registration,
        title: "Morning Registration, Twilio Quest",
        titleJP: nil,
        imageAssetName: "rikoPurple.png",
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["mainroom"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
    "day1Opening" : Session(
        type: .announcement,
        title: "Opening Remarks",
        titleJP: nil,
        imageAssetName: "announce2.png",
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["mainroom"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
    "day1Panel" : Session(
        type: .panel,
        title: "Swift Open Source Panel",
        titleJP: nil,
        imageAssetName: nil,
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["mainroom"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
    "day1Lunch" : Session(
        type: .lunch,
        title: nil,
        titleJP: nil,
        imageAssetName: "lunch.png",
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["outside"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
    "day1AfternoonRegistration" : Session(
        type: .registration,
        title: "Afternoon Registration, Twilio Quest",
        titleJP: nil,
        imageAssetName: "rikoOrange.png",
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["mainroom"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
    "day1Announcement" : Session(
        type: .announcement,
        title: "Afternoon Announcements",
        titleJP: nil,
        imageAssetName: "announce1.png",
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["mainroom"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
    "day1Presentations" : Session(
        type: .announcement,
        title: "Presentations",
        titleJP: nil,
        imageAssetName: nil,
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["mainroom"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
    "day1Workshop" : Session(
        type: .workshop,
        title: "Swift Open Source Workshop",
        titleJP: nil,
        imageAssetName: nil,
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["mainroom"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
    "day1Closing" : Session(
        type: .announcement,
        title: "Closing / Announcements",
        titleJP: nil,
        imageAssetName: "announce2.png",
        sponsor: nil,
        presentation: nil,
        location: sjo2018Locations["mainroom"],
        event: nil,
        venue: nil
    ),
//---------------------------------------------------------
]
