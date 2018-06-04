//
//  NYC2016SessionBlocks.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2018 NatashaTheRobot. All rights reserved.
//

import Foundation

public let sjo2018SessionBlocks: [SessionBlock] = [
    SessionBlock(
        startTime: Date.date(year: 2018, month: 6, day: 8, hour: 9, minute: 30, second: 0),
        endTime: Date.date(year: 2018, month: 6, day: 8, hour: 10, minute: 30, second: 0),
        sessions: [sjo2018Sessions["day1MorningRegistration"]!]
    ),
    SessionBlock(
        startTime: Date.date(year: 2018, month: 6, day: 8, hour: 10, minute: 30, second: 0),
        endTime: Date.date(year: 2018, month: 6, day: 8, hour: 10, minute: 45, second: 0),
        sessions: [sjo2018Sessions["day1Opening"]!]
    ),
    SessionBlock(
        startTime: Date.date(year: 2018, month: 6, day: 8, hour: 10, minute: 45, second: 0),
        endTime: Date.date(year: 2018, month: 6, day: 8, hour: 12, minute: 0, second: 0),
        sessions: [sjo2018Sessions["day1Panel"]!]
    ),
    SessionBlock(
        startTime: Date.date(year: 2018, month: 6, day: 8, hour: 12, minute: 0, second: 0),
        endTime: Date.date(year: 2018, month: 6, day: 8, hour: 13, minute: 0, second: 0),
        sessions: [sjo2018Sessions["day1Lunch"]!]
    ),
    SessionBlock(
        startTime: Date.date(year: 2018, month: 6, day: 8, hour: 13, minute: 0, second: 0),
        endTime: Date.date(year: 2018, month: 6, day: 8, hour: 13, minute: 30, second: 0),
        sessions: [sjo2018Sessions["day1AfternoonRegistration"]!]
    ),
    SessionBlock(
        startTime: Date.date(year: 2018, month: 6, day: 8, hour: 13, minute: 30, second: 0),
        endTime: Date.date(year: 2018, month: 6, day: 8, hour: 18, minute: 0, second: 0),
        sessions: [sjo2018Sessions["day1Workshop"]!]
    ),
    SessionBlock(
        startTime: Date.date(year: 2018, month: 6, day: 8, hour: 18, minute: 0, second: 0),
        endTime: Date.date(year: 2018, month: 6, day: 8, hour: 18, minute: 30, second: 0),
        sessions: [sjo2018Sessions["day1Closing"]!]
    )
]

