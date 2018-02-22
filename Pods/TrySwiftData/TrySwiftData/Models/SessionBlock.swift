//
//  SessionTimeBlock.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public class SessionBlock {
    /* The time in which these sessions start */
    public var startTime: Date = Date()

    /* The time in which they end */
    public var endTime: Date = Date()

    /* The sessions occurring within this block. */
    open var sessions = [Session]()

    public static var all: [SessionBlock] {
        return tko2018SessionBlocks
    }
}
