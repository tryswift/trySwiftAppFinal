//
//  NYC2016Sessions.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let nyc2018Sessions: [String : Session] = [

//---------------------------------------------------------
    // Day 0 Workshops
    
    "kitura_workshop" : Session(
        type: .workshop,
        presentation: nyc2018Presentations["kitura_workshop"],
        venue: nyc2018Venues["kitura_workshop"]
        ),
    
    "vapor_workshop" : Session(
        type: .workshop,
        presentation: nyc2018Presentations["vapor_workshop"],
        venue: nyc2018Venues["vapor_workshop"]
    ),
    
    "ar_workshop" : Session(
        type: .workshop,
        presentation: nyc2018Presentations["ar_workshop"],
        venue: nyc2018Venues["ar_workshop"]
    ),
    
    "accessiblity_workshop" : Session(
        type: .workshop,
        presentation: nyc2018Presentations["accessiblity_workshop"],
        venue: nyc2018Venues["accessibility_workshop"]
    ),
    
    "crypto_workshop" : Session(
        type: .workshop,
        presentation: nyc2018Presentations["crypto_workshop"],
        venue: nyc2018Venues["crypto_workshop"]
    ),
    
    "func_workshop" : Session(
        type: .workshop,
        presentation: nyc2018Presentations["func_workshop"],
        venue: nyc2018Venues["functional_workshop"]
    ),
    
    "kotlin_workshop" : Session(
        type: .workshop,
        presentation: nyc2018Presentations["kotlin_workshop"],
        venue: nyc2018Venues["kotlin_workshop"]
    ),
    
    
//---------------------------------------------------------
    // Day 1 Sessions
    "day1Breakfast" : Session(
        type: .breakfast,
        title: "Registration & Breakfast",
        imageAssetName: "donuts2.png",
        location:  nyc2018Locations["hall"]
    ),
//---------------------------------------------------------
    "day1Opening" : Session(
        type: .announcement,
        title: "Opening Remarks",
        imageAssetName: "announce_nyc_2.png",
        location: nyc2018Locations["stage"]
    ),
//---------------------------------------------------------
    "day1Ash" : Session(
        type: .talk,
        presentation: nyc2018Presentations["fear"],
        location: nyc2018Locations["stage"]
    ),
//---------------------------------------------------------
    "day1Bas" : Session(
        type: .talk,
        presentation: nyc2018Presentations["granted"],
        location: nyc2018Locations["stage"]
    ),
    
    "day1AshOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["fear"],
        location : nyc2018Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1FirstCoffee" : Session(
        type : .coffeeBreak,
        imageAssetName : "breaktime1.png",
        location :  nyc2018Locations["hall"]
        ),
//---------------------------------------------------------
    "day1Aileen" : Session(
        type : .talk,
        presentation : nyc2018Presentations["machinelearning"],
        location : nyc2018Locations["stage"]
        ),
    "day1BasOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["granted"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day1Berta" : Session(
        type : .talk,
        presentation : nyc2018Presentations["memojis"],
        location :   nyc2018Locations["stage"]
        ),
    "day1AileenOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["machinelearning"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Twilio" : Session(
        type : .sponsoredDemo,
        imageAssetName: "twilio_square.png",
        sponsor : nyc2018Sponsors["twilio"],
        location : nyc2018Locations["stage"]
        ),
//---------------------------------------------------------
    "day1Leah" : Session(
        type : .talk,
        presentation : nyc2018Presentations["startup"],
        location :  nyc2018Locations["stage"]
        ),
    "day1BertaOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["memojis"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day1Lunch" : Session(
        type : .lunch,
        imageAssetName : "lunch2.png",
        location :   nyc2018Locations["hall"]
        ),
//---------------------------------------------------------
    "day1Gopal" : Session(
        type : .talk,
        presentation : nyc2018Presentations["server"],
        location :   nyc2018Locations["stage"]
        ),
    "day1LeahOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["startup"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day1JW" : Session(
        type : .talk,
        presentation : nyc2018Presentations["swiftnioNetwork"],
        location :   nyc2018Locations["stage"]
    ),
    "day1GopalOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["server"],
        location : nyc2018Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day1JT" : Session(
        type : .talk,
        presentation : nyc2018Presentations["generic"],
        location :   nyc2018Locations["stage"]
        ),
    "day1JWOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["swiftnioNetwork"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day1Christina" : Session(
        type : .talk,
        presentation : nyc2018Presentations["siri"],
        location :  nyc2018Locations["stage"]
        ),
    "day1JTOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["generic"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day1SecondCoffee" : Session(
        type : .coffeeBreak,
        imageAssetName : "breaktime2.png",
        location :   nyc2018Locations["stage"]
        ),
//---------------------------------------------------------
    "day1Audrey" : Session(
        type : .talk,
        presentation : nyc2018Presentations["mlstart"],
        location :  nyc2018Locations["stage"]
        ),
    "day1ChristinaOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["siri"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day1Jen" : Session(
        type : .talk,
        presentation : nyc2018Presentations["socialmedia"],
        location :  nyc2018Locations["stage"]
        ),
    "day1AudreyOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["mlstart"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day1SDW" : Session(
        type : .talk,
        presentation : nyc2018Presentations["tactileux"],
        location :  nyc2018Locations["stage"]
        ),
    "day1JenOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["socialmedia"],
        location : nyc2018Locations["qaroom"]
        ),

//---------------------------------------------------------
    "day1Closing" : Session(
        type : .announcement,
        title : "Closing / Announcments",
        imageAssetName : "announce_nyc_1.png",
        location :   nyc2018Locations["stage"]
        ),

//---------------------------------------------------------
    "day1Party" : Session(
        type : .party,
        title : "🎳 Party",
        imageAssetName : "frames.jpg",
        venue : nyc2018Venues["frames"]
        ),


//---------------------------------------------------------
// Day 2 Sessions
    "day2Breakfast" : Session(
        type : .breakfast,
        title : "Breakfast",
        imageAssetName : "donuts1.png",
        location :   nyc2018Locations["hall"]
        ),
    //---------------------------------------------------------
    "day2Opening" : Session(
        type : .announcement,
        title : "Opening Remarks",
        imageAssetName : "announce_nyc_1.png",
        location :   nyc2018Locations["stage"]
        ),
    //---------------------------------------------------------
    "day2Felix" : Session(
        type : .talk,
        presentation : nyc2018Presentations["sdks"],
        location :   nyc2018Locations["stage"]
        ),
    "day2SDWOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["tactileux"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Logan" : Session(
        type : .talk,
        presentation : nyc2018Presentations["swiftnio"],
        location :   nyc2018Locations["stage"]
        ),
    "day2FelixOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["sdks"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2FirstCoffee" : Session(
        type : .coffeeBreak,
        imageAssetName : "breaktime1.png",
        location :   nyc2018Locations["hall"]
        ),
//---------------------------------------------------------
    "day2Tom" : Session(
        type : .talk,
        presentation : nyc2018Presentations["coredata"],
        location :   nyc2018Locations["stage"]
        ),
    "day2LoganOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["swiftnio"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Kitura" : Session(
        type : .talk,
        presentation : nyc2018Presentations["swift-services"],
        location :   nyc2018Locations["stage"]
        ),
    "day2TomOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["coredata"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2April" : Session(
        type : .talk,
        presentation : nyc2018Presentations["codereview"],
        location :   nyc2018Locations["stage"]
    ),
    "day2KituraOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["swift-services"],
        location : nyc2018Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2Lunch" : Session(
        type : .lunch,
        imageAssetName : "lunch3.png",
        location :   nyc2018Locations["hall"]
        ),
//---------------------------------------------------------
    "day2Peter" : Session(
        type : .talk,
        presentation : nyc2018Presentations["marzipan"],
        location :   nyc2018Locations["stage"]
    ),
    "day2AprilOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["codereview"],
        location : nyc2018Locations["qaroom"]
    ),
//---------------------------------------------------------
    "day2Kenmaz" : Session(
        type : .talk,
        presentation : nyc2018Presentations["coreml"],
        location :   nyc2018Locations["stage"]
        ),
    "day2PeterOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["marzipan"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Kaya" : Session(
        type : .talk,
        presentation : nyc2018Presentations["notifications"],
        location :   nyc2018Locations["stage"]
        ),
    "day2KenmazOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["coreml"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Erica" : Session(
        type : .talk,
        presentation : nyc2018Presentations["speed"],
        location :   nyc2018Locations["stage"]
        ),
    "day2KayaOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["notifications"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2SecondCoffee" : Session(
        type : .coffeeBreak,
        imageAssetName : "breaktime2.png",
        location :   nyc2018Locations["hall"]
        ),
//---------------------------------------------------------
    "day2Mattt" : Session(
        type : .talk,
        presentation : nyc2018Presentations["strings"],
        location :   nyc2018Locations["stage"]
        ),
    "day2EricaOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["speed"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Ddate" : Session(
        type : .talk,
        presentation : nyc2018Presentations["betterswift"],
        location :   nyc2018Locations["stage"]
        ),
    "day2MatttOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["strings"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Alicia" : Session(
        type : .talk,
        presentation : nyc2018Presentations["superpowers"],
        location :   nyc2018Locations["stage"]
        ),
    "day2DdateOfficeHours" : Session(
        type : .officeHours,
        presentation : nyc2018Presentations["betterswift"],
        location : nyc2018Locations["qaroom"]
        ),
//---------------------------------------------------------
    "day2Closing" : Session(
        type : .announcement,
        title : " Closing / Announcements",
        imageAssetName : "announce_nyc_2.png",
        location :   nyc2018Locations["stage"]
        )
//---------------------------------------------------------
]
