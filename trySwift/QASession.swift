//
//  QASession.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Timepiece
import Freddy

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

extension QASession: JSONDecodable {
    
    init(json: JSON) throws {
        let jsonDateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        self.id = try json.int("id")
        self.startTime = try json.string("startTime").dateFromFormat(jsonDateFormat)!
        self.endTime = try json.string("endTime").dateFromFormat(jsonDateFormat)!
        self.speakers = try Speaker.speakers.filter { try json.array("speakers").map(Int.init).contains($0.id) }
        self.location = try json.string("location")
    }
}

extension QASession {
    
    static let qaSessions: [QASession] = {
        do {
            return try dataJSON().array("sessions").filter { try $0.bool("qa") }.map(QASession.init)
        } catch {
            print(error)
            return []
        }
    }()
}

extension QASession: DayFilterable {
    
    static func qaSessions(forDate date: NSDate) -> [QASession] {
        return qaSessions.filter { $0.sameDay(asDate: date) }
    }
}
