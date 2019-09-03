//
//  NYC2016SessionBlocks.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let nyc2019SessionBlocks: [SessionBlock] = [
    
    // Day 0
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 8, hour: 14, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 8, hour: 18, minute: 0, second: 0),
        sessions : [
            nyc2019Sessions["day0Workshop1"]!,
            nyc2019Sessions["day0Workshop2"]!,
            nyc2019Sessions["day0Workshop3"]!,
            nyc2019Sessions["day0Workshop4"]!,
            nyc2019Sessions["day0Workshop5"]!,
            nyc2019Sessions["day0Workshop6"]!,
            nyc2019Sessions["day0Workshop7"]!,
            nyc2019Sessions["day0Workshop8"]!
        ]
    ),
    
    // Day 1
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 8, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 9, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day1Breakfast"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 9, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 9, minute: 45, second: 0),
        sessions : [nyc2019Sessions["day1Opening"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 9, minute: 45, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 10, minute: 15, second: 0),
        sessions : [nyc2019Sessions["day1SwiftUI"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 10, minute: 15, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 10, minute: 45, second: 0),
        sessions : [nyc2019Sessions["day1NaturalLanguage"]!,
                    nyc2019Sessions["day1SwiftUIOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 10, minute: 45, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 11, minute: 15, second: 0),
        sessions : [nyc2019Sessions["day1MobileReleases"]!,
                    nyc2019Sessions["day1NaturalLanguageOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 11, minute: 15, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 11, minute: 45, second: 0),
        sessions : [nyc2019Sessions["day1FirstCoffee"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 11, minute: 45, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 12, minute: 15, second: 0),
        sessions : [nyc2019Sessions["day1SwiftLiteral"]!,
                    nyc2019Sessions["day1MobileReleasesOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 12, minute: 15, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 12, minute: 45, second: 0),
        sessions : [nyc2019Sessions["day1JaneAusten"]!,
                    nyc2019Sessions["day1SwiftLiteralOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 12, minute: 45, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 13, minute: 15, second: 0),
        sessions : [nyc2019Sessions["day1ServerSide"]!,
                    nyc2019Sessions["day1JaneAustenOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 13, minute: 15, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 14, minute: 20, second: 0),
        sessions : [nyc2019Sessions["day1Lunch"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 14, minute: 20, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 14, minute: 50, second: 0),
        sessions : [nyc2019Sessions["day1Combine"]!,
                    nyc2019Sessions["day1ServerSideOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 14, minute: 50, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 15, minute: 20, second: 0),
        sessions : [nyc2019Sessions["day1iOSImage"]!,
                    nyc2019Sessions["day1CombineOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 15, minute: 20, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 15, minute: 50, second: 0),
        sessions : [nyc2019Sessions["day1Tensorflow"]!,
                    nyc2019Sessions["day1iOSImageOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 16, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 16, minute: 45, second: 0),
        sessions : [nyc2019Sessions["day1SecondCoffee"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 16, minute: 45, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 17, minute: 15, second: 0),
        sessions : [nyc2019Sessions["day1ARkit"]!,
                    nyc2019Sessions["day1TensorflowOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 17, minute: 15, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 17, minute: 25, second: 0),
        sessions : [nyc2019Sessions["day1LT1"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 17, minute: 25, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 17, minute: 55, second: 0),
        sessions : [nyc2019Sessions["day1ItsFine"]!,
                    nyc2019Sessions["day1ARkitOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 9, hour: 18, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 9, hour: 18, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day1Closing"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 18, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 20, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day1Party"]!]
    ),
    
    // Day 2
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 8, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 9, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day2Breakfast"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 9, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 9, minute: 45, second: 0),
        sessions : [nyc2019Sessions["day2Opening"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 9, minute: 45, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 10, minute: 15, second: 0),
        sessions : [nyc2019Sessions["day2IOS13"]!,
                    nyc2019Sessions["day2ItsFineOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 10, minute: 15, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 10, minute: 25, second: 0),
        sessions : [nyc2019Sessions["day2LT2"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 10, minute: 25, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 10, minute: 55, second: 0),
        sessions : [nyc2019Sessions["day2Encoding"]!,
                    nyc2019Sessions["day2IOS13OfficeHours"]!]
    ),

    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 11, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 11, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day2FirstCoffee"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 11, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 11, minute: 55, second: 0),
        sessions : [nyc2019Sessions["day2SwiftUI25"]!,
                    nyc2019Sessions["day2EncodingOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 12, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 12, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day2Subscriptions"]!,
                    nyc2019Sessions["day2SwiftUI25OfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 12, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 12, minute: 55, second: 0),
        sessions : [nyc2019Sessions["day2CPlusPlus"]!,
                    nyc2019Sessions["day2SubscriptionsOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 13, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 14, minute: 20, second: 0),
        sessions : [nyc2019Sessions["day2Lunch"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 14, minute: 20, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 14, minute: 50, second: 0),
        sessions : [nyc2019Sessions["day2UIColor"]!,
                    nyc2019Sessions["day2CPlusPlusOfficeHours"]!]
            ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 14, minute: 50, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 15, minute: 0, second: 0),
        sessions : [nyc2019Sessions["day2LT3"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 15, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 15, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day2APIs"]!,
                    nyc2019Sessions["day2UIColorOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 15, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 16, minute: 0, second: 0),
        sessions : [nyc2019Sessions["day2AsyncHTTPClient"]!,
                    nyc2019Sessions["day2APIsOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 16, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 16, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day2SecondCoffee"]!,
                    nyc2019Sessions["day2AyurvedaOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 16, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 17, minute: 0, second: 0),
        sessions : [nyc2019Sessions["day2NoScreens"]!,
                    nyc2019Sessions["day2AsyncHTTPClientOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 17, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 17, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day2Bitcoin"]!,
                    nyc2019Sessions["day2NoScreensOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 17, minute: 30, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 18, minute: 0, second: 0),
        sessions : [nyc2019Sessions["day2Ayurveda"]!,
                    nyc2019Sessions["day2BitcoinOfficeHours"]!]
    ),
    
    SessionBlock(
        startTime : Date.date(year: 2019, month: 9, day: 10, hour: 18, minute: 0, second: 0),
        endTime : Date.date(year: 2019, month: 9, day: 10, hour: 18, minute: 30, second: 0),
        sessions : [nyc2019Sessions["day2Closing"]!]
    ),
]

