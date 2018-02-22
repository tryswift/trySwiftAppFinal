//
//  TKO2018ConferenceDays.swift
//  TrySwiftData_Tests
//
//  Created by Natasha Murashev on 2/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

public let tko2018ConferenceDays: [ConferenceDay] = [
{
    let day1 = ConferenceDay()
    day1.date = Date.date(year: 2018, month: 3, day: 1, hour: 8, minute: 30, second: 0)
    for index in 0...20 {
        day1.sessionBlocks.append(tko2018SessionBlocks[index])
    }
    return day1
    }(),
{
    let day2 = ConferenceDay()
    day2.date = Date.date(year: 2018, month: 3, day: 2, hour: 9, minute: 0, second: 0)
    for index in 21...43 {
        day2.sessionBlocks.append(tko2018SessionBlocks[index])
    }
    return day2
    }(),
{
    let day3 = ConferenceDay()
    day3.date = Date.date(year: 2018, month: 3, day: 3, hour: 9, minute: 30, second: 0)
    for index in 44...45 {
        day3.sessionBlocks.append(tko2018SessionBlocks[index])
    }
    return day3
    }()
]
