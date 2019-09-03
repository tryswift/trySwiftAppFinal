//
//  ConferenceDay.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public struct ConferenceDay {
    /* The date of this particular day of the conference. */
    public let date: Date

    /* The list of sessions, sorted into time blocks for that day. */
    public let sessionBlocks: [SessionBlock]

    public static let all = nyc2019ConferenceDays.sorted { $0.date < $1.date }
}
