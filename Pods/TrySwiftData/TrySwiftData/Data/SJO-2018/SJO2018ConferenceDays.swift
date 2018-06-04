//
//  TKO2018ConferenceDays.swift
//  TrySwiftData_Tests
//
//  Created by Natasha Murashev on 2/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

public let sjo2018ConferenceDays: [ConferenceDay] = [
    ConferenceDay(
        date: Date.date(year: 2018, month: 6, day: 8, hour: 9, minute: 30, second: 0),
        sessionBlocks: Array(sjo2018SessionBlocks[0...6])
    )
]
