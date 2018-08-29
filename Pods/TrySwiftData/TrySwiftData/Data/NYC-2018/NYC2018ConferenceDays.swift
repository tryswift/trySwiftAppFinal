//
//  NYC2016ConferenceDays.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public let nyc2018ConferenceDays: [ConferenceDay] = [
    ConferenceDay(
        date: Date.date(year: 2018, month: 9, day: 3, hour: 14, minute: 0, second: 0),
        sessionBlocks: Array(nyc2018SessionBlocks[0..<1])
        ),
    ConferenceDay(
        date: Date.date(year: 2018, month: 9, day: 4, hour: 8, minute: 0, second: 0),
        sessionBlocks: Array(nyc2018SessionBlocks[1...19])
        ),
    ConferenceDay(
        date: Date.date(year: 2018, month: 9, day: 5, hour: 8, minute: 0, second: 0),
        sessionBlocks: Array(nyc2018SessionBlocks[20...38])
        )
]

