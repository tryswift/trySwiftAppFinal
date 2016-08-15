//
//  Timeslot.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Timepiece

struct Session {
    let id: Int
    let startTime: NSDate
    let endTime: NSDate
    let description: Description
}

// date / time formatting
extension Session {
    
    var timeString: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        
        return "\(dateFormatter.stringFromDate(startTime)) - \(dateFormatter.stringFromDate(endTime))"
    }
    
    var dateTimeString: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE hhmm")
        let startTime = dateFormatter.stringFromDate(self.startTime)
        
        dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm")
        let endTime = dateFormatter.stringFromDate(self.endTime)
        return "\(startTime) - \(endTime)"
    }
}

// Description Details
extension Session {
    
    enum Description: CustomStringConvertible {
        // add GA workshop, Metup
        case Breakfast(String)
        case Announcement(String)
        case Talk(Presentation)
        case CoffeeBreak(Sponsor?)
        case Lunch
        case OfficeHours(Presentation)
        case Party(Venue)
        
        var title: String {
            switch self {
            case .Breakfast(let title):
                return title
            case .Announcement(let title):
                return title
            case .Talk(let presentation):
                return presentation.title
            case .CoffeeBreak(_):
                    return "☕️ Break"
            case .Lunch:
                return "🍝 Lunch"
            case .OfficeHours(let presentation):
                return "Office Hours with \(presentation.speaker?.name)"
            case .Party(_):
                return "🍕 & 🎸 Party with Airplane Mode"
            }
        }
        
        var subtitle: String {
            switch self {
            case .Breakfast(_), .Announcement(_), .Lunch:
                return "try! NYC Conference"
            case .Talk(let presentation):
                return presentation.speaker?.name ?? "try! NYC Conference"
            case .CoffeeBreak(let sponsor):
                if let sponsor = sponsor {
                    return sponsor.name
                } else {
                    return "try! NYC Conference"
                }
            case .OfficeHours(let presentation):
                return "Office Hours with \(presentation.speaker?.name)"
            case .Party(_):
                return "Perfect.org"
            }
        }
        
        var logo: String {
            switch self {
            case .Breakfast(_), .CoffeeBreak(_), .Lunch, .Announcement(_):
                return "tryLogo"
            case .Talk(let presentation):
                return presentation.speaker?.imageName ?? "tryLogo"
            case .OfficeHours(let presentation):
                return presentation.speaker?.imageName ?? "tryLogo"
            case .Party(_):
                return "airplaneMode"
            }
        }
        
        var location: String {
            switch self {
            case .Breakfast(_), .CoffeeBreak(_), .Lunch:
                return "North Lobby"
            case .Announcement(_), .Talk(_):
                return "Auditorium"
            case .OfficeHours(_):
                return "Attrium"
            case .Party(let venue):
                return venue.address
            }
        }
        
        var description: String {
            switch self {
            case .Breakfast(_), .CoffeeBreak(_), .Lunch:
                return "❤️"
            case .Announcement(_):
                return "📣"
            case .Talk(_):
                return "Presentation"
            case .OfficeHours(_):
                return "Office Hours"
            case .Party(_):
                return "🎉🎉🎉"
            }
        }
    }
}

extension Session {
    
    static let sessions: [Session] = [
        
    ]
}

/*
 "sessions": [{
 "id": 101,
 "startTime": "2016-08-31T16:00:00",
 "endTime": "2016-08-31T18:00:00",
 "description": "Swift Workshop by General Assembly",
 "location": "10 East 21st Street",
 "speakers": null,
 "qa": false
 }, {
 "id": 102,
 "startTime": "2016-08-31T18:30:00",
 "endTime": "2016-08-31T20:00:00",
 "description": "Pre-Event Party by Meetup",
 "location": "632 Broadway",
 "speakers": null,
 "qa": false
 }, {
 "id": 201,
 "startTime": "2016-09-01T09:00:00",
 "endTime": "2016-09-01T09:45:00",
 "description": "Registration & Breakfast",
 "location": "North Lobby",
 "speakers": null,
 "qa": false
 }, {
 "id": 202,
 "startTime": "2016-09-01T09:45:00",
 "endTime": "2016-09-01T10:00:00",
 "description": "Opening Remarks",
 "location": "Auditorium",
 "speakers": null,
 "qa": false
 }, {
 "id": 203,
 "startTime": "2016-09-01T10:00:00",
 "endTime": "2016-09-01T10:30:00",
 "description": "Lambda: There and Back Again",
 "location": "Auditorium",
 "speakers": [3],
 "qa": false
 }, {
 "id": 204,
 "startTime": "2016-09-01T10:30:00",
 "endTime": "2016-09-01T11:00:00",
 "description": "Random Talk: The Consistent World of Noise",
 "location": "Auditorium",
 "speakers": [5],
 "qa": false
 }, {
 "id": 205,
 "startTime": "2016-09-01T11:00:00",
 "endTime": "2016-09-01T11:30:00",
 "description": "Break, by DOMO",
 "location": "North Lobby",
 "speakers": null,
 "qa": false
 }, {
 "id": 206,
 "startTime": "2016-09-01T11:30:00",
 "endTime": "2016-09-01T12:00:00",
 "description": "Building a Tiny Compiler",
 "location": "Auditorium",
 "speakers": [12],
 "qa": false
 }, {
 "id": 207,
 "startTime": "2016-09-01T12:00:00",
 "endTime": "2016-09-01T12:30:00",
 "description": "Incremental Swift",
 "location": "Auditorium",
 "speakers": [11],
 "qa": false
 }, {
 "id": 208,
 "startTime": "2016-09-01T12:30:00",
 "endTime": "2016-09-01T13:15:00",
 "description": "Healthy Minds in a Healthy Community",
 "location": "Auditorium",
 "speakers": [23],
 "qa": false
 }, {
 "id": 209,
 "startTime": "2016-09-01T13:15:00",
 "endTime": "2016-09-01T14:30:00",
 "description": "Lunch",
 "location": "North Lobby",
 "speakers": null,
 "qa": false
 }, {
 "id": 210,
 "startTime": "2016-09-01T14:30:00",
 "endTime": "2016-09-01T15:00:00",
 "description": "Extending Xcode 8",
 "location": "Auditorium",
 "speakers": [18],
 "qa": false
 }, {
 "id": 211,
 "startTime": "2016-09-01T15:00:00",
 "endTime": "2016-09-01T15:30:00",
 "description": "Say It Ain't So: Implementing Speech Recognition in your app",
 "location": "Auditorium",
 "speakers": [2],
 "qa": false
 }, {
 "id": 212,
 "startTime": "2016-09-01T15:30:00",
 "endTime": "2016-09-01T16:00:00",
 "description": "TBD",
 "location": "Auditorium",
 "speakers": [4],
 "qa": false
 }, {
 "id": 213,
 "startTime": "2016-09-01T16:30:00",
 "endTime": "2016-09-01T16:30:00",
 "description": "Break",
 "location": "North Lobby",
 "speakers": null,
 "qa": false
 }, {
 "id": 214,
 "startTime": "2016-09-01T16:30:00",
 "endTime": "2016-09-01T17:00:00",
 "description": "Pushing the Envelope with iOS 10 Notifications",
 "location": "Auditorium",
 "speakers": [1],
 "qa": false
 }, {
 "id": 215,
 "startTime": "2016-09-01T17:00:00",
 "endTime": "2016-09-01T17:30:00",
 "description": "Decoding JSON with Swift",
 "location": "Auditorium",
 "speakers": [10],
 "qa": false
 }, {
 "id": 216,
 "startTime": "2016-09-01T17:30:00",
 "endTime": "2016-09-01T18:00:00",
 "description": "Architectural Superpowers",
 "location": "Auditorium",
 "speakers": [8],
 "qa": false
 }, {
 "id": 217,
 "startTime": "2016-09-01T18:00:00",
 "endTime": "2016-09-01T18:30:00",
 "description": "Closing / Announcements",
 "location": "Auditorium",
 "speakers": null,
 "qa": false
 }, {
 "id": 218,
 "startTime": "2016-09-01T18:30:00",
 "endTime": "2016-09-01T22:00:00",
 "description": "Pizza & Music party with Airplane Mode, sponsored by Perfect.org",
 "location": "251 W 30th St",
 "speakers": null,
 "qa": false
 }, {
 "id": 301,
 "startTime": "2016-09-02T09:00:00",
 "endTime": "2016-09-02T09:45:00",
 "description": "Breakfast",
 "location": "North Lobby",
 "speakers": null,
 "qa": false
 }, {
 "id": 302,
 "startTime": "2016-09-02T09:45:00",
 "endTime": "2016-09-02T10:00:00",
 "description": "Opening Remarks",
 "location": "Auditorium",
 "speakers": null,
 "qa": false
 }, {
 "id": 303,
 "startTime": "2016-09-02T10:00:00",
 "endTime": "2016-09-02T10:30:00",
 "description": "End-to-end application development in Swift",
 "location": "Auditorium",
 "speakers": [25, 26],
 "qa": false
 }, {
 "id": 304,
 "startTime": "2016-09-02T10:30:00",
 "endTime": "2016-09-02T11:00:00",
 "description": "Driving User Engagement with watchOS 3",
 "location": "Auditorium",
 "speakers": [7],
 "qa": false
 }, {
 "id": 305,
 "startTime": "2016-09-02T11:00:00",
 "endTime": "2016-09-02T11:30:00",
 "description": "Break, by DOMO",
 "location": "North Lobby",
 "speakers": null,
 "qa": false
 }, {
 "id": 306,
 "startTime": "2016-09-02T11:30:00",
 "endTime": "2016-09-02T12:00:00",
 "description": "Property-Based Testing with SwiftCheck",
 "location": "Auditorium",
 "speakers": [17],
 "qa": false
 }, {
 "id": 307,
 "startTime": "2016-09-02T12:00:00",
 "endTime": "2016-09-02T12:30:00",
 "description": "Result Oriented Development",
 "location": "Auditorium",
 "speakers": [20],
 "qa": false
 }, {
 "id": 308,
 "startTime": "2016-09-02T12:30:00",
 "endTime": "2016-09-02T13:00:00",
 "description": "While Technology Changes, Human Biology is much more Static",
 "location": "Auditorium",
 "speakers": [19],
 "qa": false
 }, {
 "id": 309,
 "startTime": "2016-09-02T13:00:00",
 "endTime": "2016-09-02T13:15:00",
 "description": "Sponsored Demo",
 "location": "Auditorium",
 "speakers": null,
 "qa": false
 }, {
 "id": 310,
 "startTime": "2016-09-02T13:15:00",
 "endTime": "2016-09-02T14:30:00",
 "description": "Lunch",
 "location": "North Lobby",
 "speakers": null,
 "qa": false
 }, {
 "id": 311,
 "startTime": "2016-09-02T14:30:00",
 "endTime": "2016-09-02T15:00:00",
 "description": "Building user-centric security model in iOS applications",
 "location": "Auditorium",
 "speakers": [9],
 "qa": false
 }, {
 "id": 312,
 "startTime": "2016-09-02T15:00:00",
 "endTime": "2016-09-02T15:30:00",
 "description": "Making rich text editor in Swift",
 "location": "Auditorium",
 "speakers": [27],
 "qa": false
 }, {
 "id": 313,
 "startTime": "2016-09-02T15:30:00",
 "endTime": "2016-09-02T16:00:00",
 "description": "Building a Better Language App with Swift",
 "location": "Auditorium",
 "speakers": [22],
 "qa": false
 }, {
 "id": 314,
 "startTime": "2016-09-02T16:00:00",
 "endTime": "2016-09-02T16:30:00",
 "description": "Break",
 "location": "North Lobby",
 "speakers": null,
 "qa": false
 }, {
 "id": 315,
 "startTime": "2016-09-02T16:30:00",
 "endTime": "2016-09-02T17:00:00",
 "description": "I make iOS apps - is RxSwift for me?",
 "location": "Auditorium",
 "speakers": [21],
 "qa": false
 }, {
 "id": 316,
 "startTime": "2016-09-02T17:00:00",
 "endTime": "2016-09-02T17:30:00",
 "description": "Swift eye for the Objective-C API",
 "location": "Auditorium",
 "speakers": [6],
 "qa": false
 }, {
 "id": 317,
 "startTime": "2016-09-02T17:30:00",
 "endTime": "2016-09-02T18:00:00",
 "description": "Refactoring at scale – Lessons learned rewriting Instagram’s feed",
 "location": "Auditorium",
 "speakers": [24],
 "qa": false
 }, {
 "id": 318,
 "startTime": "2016-09-02T18:00:00",
 "endTime": "2016-09-02T18:30:00",
 "description": "Closing / Announcements",
 "location": "Auditorium",
 "speakers": null,
 "qa": false
 */
