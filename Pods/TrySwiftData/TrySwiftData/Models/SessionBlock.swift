//
//  SessionTimeBlock.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public struct SessionBlock {
    /* The time in which these sessions start */
    public let startTime: Date

    /* The time in which they end */
    public let endTime: Date

    /* The sessions occurring within this block. */
    public let sessions: [Session]

    public static var all: [SessionBlock] {
        return nyc2019SessionBlocks
    }
}
