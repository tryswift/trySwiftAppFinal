//
//  Session.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import TrySwiftDataWatch

extension Session {
    
    var timeString: String {
        return "\(startTime.timeString(in: .short)) - \(endTime.timeString(in: .short))"
    }
    
    static let sessionsAug31Filtered = Session.sessionsAug31.flatMap{ $0 }.filter{ $0.index != nil}
    static let sessionsSept1Filtered = Session.sessionsSept1.flatMap{ $0 }.filter{ $0.index != nil}
    static let sessionsSept2Filtered = Session.sessionsSept2.flatMap{ $0 }.filter{ $0.index != nil}
    
    static let sessions: [Session] = {
        return [Session.sessionsAug31Filtered, sessionsSept1Filtered, sessionsSept2Filtered].flatMap{ $0 }
    }()
}
