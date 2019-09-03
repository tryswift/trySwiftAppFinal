//
//  NYC2016Sessions.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let nyc2019Sessions: [String : Session] = [
//---------------------------------------------------------
    
    // Day 0 Workshops
    "day0Workshop1" : Session(
        type : .workshop,
        title : "SwiftUI Hands-on",
        imageAssetName : "paul.jpg",
        presentation : nyc2019Presentations["swiftui"],
        venue :   nyc2019Venues["swiftui-workshop"]
    ),
    "day0Workshop2" : Session(
        type : .workshop,
        title : "Super Easy Combine - This is an Awesome App Workshop",
        imageAssetName : "pauls.jpg",
        presentation : nyc2019Presentations["combinewrkshp"],
        venue :   nyc2019Venues["combine-workshop"]
    ),
    "day0Workshop3" : Session(
        type : .workshop,
        title : "Build a cloud-ready WebSocket server in Swift",
        imageAssetName : "sanjian.png",
        presentation : nyc2019Presentations["websocket"],
        venue :   nyc2019Venues["websocket-workshop"]
    ),
    "day0Workshop4" : Session(
        type : .workshop,
        title : "Bose AR SDK for Native iOS",
        imageAssetName : "bosearsquare.png",
        presentation : nyc2019Presentations["bosear"],
        venue :   nyc2019Venues["bosear-workshop"]
    ),
    "day0Workshop5" : Session(
        type : .workshop,
        title : "Swift on the Raspberry PI - Building A Circuit to Control an LED",
        imageAssetName : "marc.jpg",
        presentation : nyc2019Presentations["raspberrypi"],
        venue :   nyc2019Venues["pi-workshop"]
    ),
    "day0Workshop6" : Session(
        type : .workshop,
        title : "Fractal: Atomic Design Theory with Declarative UI (think SwiftUI for Today)",
        imageAssetName : "jonbott.jpg",
        presentation : nyc2019Presentations["fractal"],
        venue :   nyc2019Venues["fractal-workshop"]
    ),
    "day0Workshop7" : Session(
        type : .workshop,
        title : "Technology Experience Prototyping",
        imageAssetName : "carson_mark.jpg",
        presentation : nyc2019Presentations["prototyping"],
        venue :   nyc2019Venues["prototyping-workshop"]
    ),
    "day0Workshop8" : Session(
        type : .workshop,
        title : "Professional Communication Skill-Building",
        imageAssetName : "chris.jpg",
        presentation : nyc2019Presentations["communication"],
        venue :   nyc2019Venues["communication-workshop"]
    ),
    
    // Day 1 Sessions
    "day1Breakfast" : Session(
        type: .breakfast,
        title: "Registration & Breakfast",
        imageAssetName: "donuts2.png",
        location:  nyc2019Locations["hall"]
    ),
//---------------------------------------------------------
    "day1Opening" : Session(
        type: .announcement,
        title: "Opening Remarks",
        imageAssetName: "announce_nyc_2.png",
        location: nyc2019Locations["hall"]
    ),
//---------------------------------------------------------
    "day1SwiftUI" : Session(
        type: .talk,
        presentation: nyc2019Presentations["swiftui-production"],
        location: nyc2019Locations["stage"]
    ),
    "day1SwiftUIOfficeHours" : Session(
        type: .officeHours,
        presentation: nyc2019Presentations["swiftui-production"],
        location: nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1NaturalLanguage" : Session(
        type: .talk,
        presentation: nyc2019Presentations["natural-languages"],
        location: nyc2019Locations["stage"]
    ),
    "day1NaturalLanguageOfficeHours" : Session(
        type: .officeHours,
        presentation: nyc2019Presentations["natural-languages"],
        location: nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1MobileReleases" : Session(
        type: .talk,
        presentation: nyc2019Presentations["mobile-releases"],
        location: nyc2019Locations["stage"]
    ),
    "day1MobileReleasesOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["mobile-releases"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1FirstCoffee" : Session(
        type : .coffeeBreak,
        imageAssetName : "breaktime1.png",
        location :  nyc2019Locations["hall"]
        ),
//---------------------------------------------------------
    "day1SwiftLiteral" : Session(
        type : .talk,
        presentation : nyc2019Presentations["swift-literal"],
        location : nyc2019Locations["stage"]
        ),
    "day1SwiftLiteralOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["swift-literal"],
        location : nyc2019Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day1JaneAusten" : Session(
        type : .talk,
        presentation : nyc2019Presentations["jane-austen"],
        location : nyc2019Locations["stage"]
    ),
    "day1JaneAustenOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["jane-austen"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1ServerSide" : Session(
        type : .talk,
        presentation : nyc2019Presentations["server-side"],
        location : nyc2019Locations["stage"]
    ),
    "day1ServerSideOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["server-side"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1Lunch" : Session(
        type : .lunch,
        imageAssetName : "lunch2.png",
        location :   nyc2019Locations["hall"]
        ),
//---------------------------------------------------------
    "day1Combine" : Session(
        type : .talk,
        presentation : nyc2019Presentations["combine"],
        location : nyc2019Locations["stage"]
    ),
    "day1CombineOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["combine"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1iOSImage" : Session(
        type : .talk,
        presentation : nyc2019Presentations["ios-image"],
        location : nyc2019Locations["stage"]
    ),
    "day1iOSImageOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["ios-image"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1Tensorflow" : Session(
        type : .talk,
        presentation : nyc2019Presentations["tensorflow"],
        location : nyc2019Locations["stage"]
    ),
    "day1TensorflowOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["tensorflow"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1SecondCoffee" : Session(
        type : .coffeeBreak,
        imageAssetName : "breaktime2.png",
        location :   nyc2019Locations["hall"]
        ),
//---------------------------------------------------------
    "day1ARkit" : Session(
        type : .talk,
        presentation : nyc2019Presentations["arkit-coreml"],
        location : nyc2019Locations["stage2"]
    ),
    "day1ARkitOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["arkit-coreml"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1LT1" : Session(
        type: .lightningTalk,
        presentation: nyc2019Presentations["lt1"],
        location: nyc2019Locations["stage2"]
    ),
//---------------------------------------------------------
    "day1ItsFine" : Session(
        type : .talk,
        presentation : nyc2019Presentations["its-fine"],
        location : nyc2019Locations["stage2"]
    ),
    "day2ItsFineOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["its-fine"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1Closing" : Session(
        type : .announcement,
        title : "Closing / Announcments",
        imageAssetName : "announce_nyc_1.png",
        location :   nyc2019Locations["stage"]
        ),

//---------------------------------------------------------
    "day1Party" : Session(
        type : .party,
        title : "🎳 Party",
        imageAssetName : "frames.jpg",
        location :   nyc2019Locations["party"],
        venue: nyc2019Venues["frames-nyc"] //TODO
    ),
    
//---------------------------------------------------------
    // Day 2 Sessions
    "day2Breakfast" : Session(
        type : .breakfast,
        title : "Breakfast",
        imageAssetName : "donuts1.png",
        location :   nyc2019Locations["hall"]
        ),
//---------------------------------------------------------
    "day2Opening" : Session(
        type : .announcement,
        title : "Opening Remarks",
        imageAssetName : "announce_nyc_1.png",
        location :   nyc2019Locations["stage"]
        ),
//---------------------------------------------------------
    "day2IOS13" : Session(
        type : .talk,
        presentation : nyc2019Presentations["ios13"],
        location :   nyc2019Locations["stage"]
        ),
    "day2IOS13OfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["ios13"],
        location : nyc2019Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2LT2" : Session(
        type: .lightningTalk,
        presentation: nyc2019Presentations["lt2"],
        location: nyc2019Locations["stage"]
    ),
//---------------------------------------------------------
    "day2Encoding" : Session(
        type : .talk,
        presentation : nyc2019Presentations["encoding-decoding"],
        location :   nyc2019Locations["stage"]
    ),
    "day2EncodingOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["encoding-decoding"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2FirstCoffee" : Session(
        type : .coffeeBreak,
        imageAssetName : "breaktime1.png",
        location :   nyc2019Locations["hall"]
        ),
//---------------------------------------------------------
    "day2SwiftUI25" : Session(
        type : .talk,
        presentation : nyc2019Presentations["swiftui25"],
        location :   nyc2019Locations["stage"]
        ),
    "day2SwiftUI25OfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["swiftui25"],
        location : nyc2019Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Subscriptions" : Session(
        type : .talk,
        presentation : nyc2019Presentations["app-subscriptions"],
        location :   nyc2019Locations["stage"]
    ),
    "day2SubscriptionsOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["app-subscriptions"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2CPlusPlus" : Session(
        type : .talk,
        presentation : nyc2019Presentations["cplusplus"],
        location :   nyc2019Locations["stage"]
    ),
    "day2CPlusPlusOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["cplusplus"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2Lunch" : Session(
        type : .lunch,
        imageAssetName : "lunch3.png",
        location :   nyc2019Locations["hall"]
        ),
//---------------------------------------------------------
    "day2UIColor" : Session(
        type : .talk,
        presentation : nyc2019Presentations["uicolor"],
        location :   nyc2019Locations["stage"]
    ),
    "day2UIColorOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["uicolor"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2LT3" : Session(
        type: .lightningTalk,
        presentation: nyc2019Presentations["lt3"],
        location: nyc2019Locations["stage"]
    ),
//---------------------------------------------------------
    "day2APIs" : Session(
        type : .talk,
        presentation : nyc2019Presentations["apis"],
        location :   nyc2019Locations["stage"]
    ),
    "day2APIsOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["apis"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2AsyncHTTPClient" : Session(
        type : .talk,
        presentation : nyc2019Presentations["AsyncHTTPClient"],
        location :   nyc2019Locations["stage"]
    ),
    "day2AsyncHTTPClientOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["AsyncHTTPClient"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2SecondCoffee" : Session(
        type : .coffeeBreak,
        imageAssetName : "breaktime2.png",
        location :   nyc2019Locations["hall"]
        ),
//---------------------------------------------------------
    "day2NoScreens" : Session(
        type : .talk,
        presentation : nyc2019Presentations["no-screens"],
        location :   nyc2019Locations["stage"]
        ),
    "day2NoScreensOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["no-screens"],
        location : nyc2019Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Bitcoin" : Session(
        type : .talk,
        presentation : nyc2019Presentations["bitcoin-cash"],
        location :   nyc2019Locations["stage"]
        ),
    "day2BitcoinOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["bitcoin-cash"],
        location : nyc2019Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Ayurveda" : Session(
        type : .talk,
        presentation : nyc2019Presentations["ayurveda"],
        location :   nyc2019Locations["stage"]
    ),
    "day2AyurvedaOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2019Presentations["ayurveda"],
        location : nyc2019Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2Closing" : Session(
        type : .announcement,
        title : " Closing / Announcements",
        imageAssetName : "announce_nyc_2.png",
        location :   nyc2019Locations["stage"]
        ),

]
