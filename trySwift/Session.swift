//
//  Timeslot.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Timepiece
import Freddy

struct Session {
    let id: Int
    let startTime: NSDate
    let endTime: NSDate
    let description: String
    let location: String
    let speaker: Speaker?
    
    var timeString: String {
        return "\(startTime.stringFromFormat("H:mm")) - \(endTime.stringFromFormat("H:mm"))"
    }
    
    var dateTimeString: String {
        let format = isJapanese ? "MMMM d H:mm" : "EEEE, H:mm"
        return "\(startTime.stringFromFormat(format)) - \(endTime.stringFromFormat("H:mm"))"
    }
}

extension Session: JSONDecodable {
    
    init(json: JSON) throws {
        let jsonDateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        self.id = try json.int("id")
        self.startTime = try json.string("startTime").dateFromFormat(jsonDateFormat)!
        self.endTime = try json.string("endTime").dateFromFormat(jsonDateFormat)!
        self.description = try json.string("description")
        self.location = try json.string("location")
        
        self.speaker = try Speaker.speakers.filter { try (json.array("speakers", ifNull: true) ?? []).flatMap(Int.init).contains($0.id) }.first
    }
}

extension Session {
    
    static let sessions: [Session] = {
        do {
            return try dataJSON().array("sessions").filter { try !$0.bool("qa") }.map(Session.init)
        } catch {
            print(error)
            return []
        }
    }()
}

extension Session: DayFilterable {

    static func sessions(forDate date: NSDate) -> [Session] {
        return sessions.filter { $0.sameDay(asDate: date) }
    }
}
