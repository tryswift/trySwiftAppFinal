//
//  NYC2016SessionBlocks.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let nyc2018SessionBlocks: [SessionBlock] = [
   
    // Day 0
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 3, hour: 14, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 3, hour: 18, minute: 0, second: 0),
        sessions : [
            nyc2018Sessions["kitura_workshop"]!,
            nyc2018Sessions["vapor_workshop"]!,
            nyc2018Sessions["ar_workshop"]!,
            nyc2018Sessions["accessiblity_workshop"]!,
            nyc2018Sessions["crypto_workshop"]!,
            nyc2018Sessions["func_workshop"]!,
            nyc2018Sessions["kotlin_workshop"]!
        ]
    ),
    
    // Day 1
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 8, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 9, minute: 45, second: 0),
        sessions : [nyc2018Sessions["day1Breakfast"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 9, minute: 45, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 9, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1Opening"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 10, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 10, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day1Ash"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 10, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 10, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1Bas"]!,
                    nyc2018Sessions["day1AshOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 11, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 11, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day1FirstCoffee"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 11, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 11, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1Aileen"]!,
                    nyc2018Sessions["day1BasOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 12, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 12, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day1Berta"]!,
                    nyc2018Sessions["day1AileenOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 12, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 12, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1Leah"]!,
                    nyc2018Sessions["day1BertaOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 13, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 13, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1Lunch"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 14, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 14, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day1Gopal"]!,
                    nyc2018Sessions["day1LeahOfficeHours"]!]
    ),

    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 14, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 14, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1JW"]!,
                    nyc2018Sessions["day1GopalOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 15, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 15, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day1JT"]!,
                    nyc2018Sessions["day1JWOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 15, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 15, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1Christina"]!,
                    nyc2018Sessions["day1JTOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 16, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 16, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day1SecondCoffee"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 16, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 16, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1Audrey"]!,
                    nyc2018Sessions["day1ChristinaOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 17, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 17, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day1Jen"]!,
                    nyc2018Sessions["day1AudreyOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 17, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 17, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day1SDW"]!,
                    nyc2018Sessions["day1JenOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 18, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 18, minute: 30, second: 0),
        sessions : [nyc2018Sessions["day1Closing"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 4, hour: 19, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 4, hour: 21, minute: 0, second: 0),
        sessions : [nyc2018Sessions["day1Party"]!]
    ),
    
    // Day 2
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 9, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 9, minute: 45, second: 0),
        sessions : [nyc2018Sessions["day2Breakfast"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 9, minute: 45, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 10, minute: 0, second: 0),
        sessions : [nyc2018Sessions["day2Opening"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 10, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 10, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day2Felix"]!,
                    nyc2018Sessions["day2SDWOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 10, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 10, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day2Logan"]!,
                    nyc2018Sessions["day2FelixOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 11, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 11, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day2FirstCoffee"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 11, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 11, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day2Tom"]!,
                    nyc2018Sessions["day2LoganOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 12, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 12, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day2Kitura"]!,
                    nyc2018Sessions["day2TomOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 12, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 12, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day2April"]!,
                    nyc2018Sessions["day2KituraOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 13, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 13, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day2Lunch"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 14, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 14, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day2Peter"]!,
                    nyc2018Sessions["day2AprilOfficeHours"]!]
            ),
            

    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 14, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 14, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day2Kenmaz"]!,
                    nyc2018Sessions["day2PeterOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 15, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 15, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day2Kaya"]!,
                    nyc2018Sessions["day2KenmazOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 15, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 15, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day2Erica"]!,
                    nyc2018Sessions["day2KayaOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 16, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 16, minute: 25, second: 0),
        sessions : [nyc2018Sessions["day2SecondCoffee"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 16, minute: 30, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 16, minute: 55, second: 0),
        sessions : [nyc2018Sessions["day2Mattt"]!,
                    nyc2018Sessions["day2EricaOfficeHours"]!]
    ),

    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 17, minute: 0, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 17, minute: 10, second: 0),
        sessions : [nyc2018Sessions["day2Twilio"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 17, minute: 15, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 17, minute: 40, second: 0),
        sessions : [nyc2018Sessions["day2Ddate"]!,
                    nyc2018Sessions["day2MatttOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 17, minute: 45, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 18, minute: 10, second: 0),
        sessions : [nyc2018Sessions["day2Alicia"]!,
                    nyc2018Sessions["day2DdateOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2018, month: 9, day: 5, hour: 18, minute: 15, second: 0),
        endTime : Date.date(year: 2018, month: 9, day: 5, hour: 18, minute: 30, second: 0),
        sessions : [nyc2018Sessions["day2Closing"]!]
    ),
]

