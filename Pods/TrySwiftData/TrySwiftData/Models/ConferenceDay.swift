//
//  ConferenceDay.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public class ConferenceDay {
    /* The date of this particular day of the conference. */
    public var date: Date = Date()

    /* The list of sessions, sorted into time blocks for that day. */
    open var sessionBlocks = [SessionBlock]()

    public static var all: [ConferenceDay] {
        return tko2018ConferenceDays.sorted { $0.date < $1.date }
    }
}
