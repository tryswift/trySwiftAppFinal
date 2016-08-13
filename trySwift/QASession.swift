//
//  QASession.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Timepiece

struct QASession {
    let id: Int
    let startTime: NSDate
    let endTime: NSDate
    let speakers: [Speaker]
    let location: String
    
    var title: String {
        if let speaker = speakers.first where speakers.count == 1 {
            return "Q&A with \(speaker.name)"
        }
        
        var speakerNames = speakers.map { $0.name }
        if let lastName = speakerNames.last {
            let newLast = "& \(lastName)"
            speakerNames = Array(speakerNames.dropLast())
            speakerNames.append(newLast)
        }
        
        return "Q&A with \(speakerNames.joinWithSeparator(", "))"
    }
}

extension QASession: DayFilterable {
    
    static func qaSessions(forDate date: NSDate) -> [QASession] {
        return []
       // return qaSessions.filter { $0.sameDay(asDate: date) }
    }
}
