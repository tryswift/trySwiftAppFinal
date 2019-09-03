//
//  NYC2016ConferenceDays.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public let nyc2019ConferenceDays: [ConferenceDay] = [
    ConferenceDay(
        date: Date.date(year: 2019, month: 9, day: 8, hour: 14, minute: 0, second: 0),
        sessionBlocks: Array(nyc2019SessionBlocks[0..<1])
        ),
    ConferenceDay(
        date: Date.date(year: 2019, month: 9, day: 9, hour: 8, minute: 30, second: 0),
        sessionBlocks: Array(nyc2019SessionBlocks[1...19])
        ),
    ConferenceDay(
        date: Date.date(year: 2019, month: 9, day: 10, hour: 8, minute: 30, second: 0),
        sessionBlocks: Array(nyc2019SessionBlocks[20...38])
        )
]

