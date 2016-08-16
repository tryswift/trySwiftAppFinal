//
//  Timeslot.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Timepiece
import RealmSwift

struct Session {
    let id: Int
    let startTime: NSDate
    let endTime: NSDate
    let info: Info
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
    
    enum Info: CustomStringConvertible {

        case Workshop(Event)
        case Meetup(Event)
        case Breakfast(String)
        case Announcement(String)
        case Talk(Presentation)
        case CoffeeBreak(Sponsor?)
        case Lunch
        case OfficeHours(Presentation)
        case Party(Venue)
        
        var title: String {
            switch self {
            case .Workshop(let event):
                return event.title
            case .Meetup(let event):
                return event.title
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
                if let speaker = presentation.speaker?.name {
                    return "Office Hours with \(speaker)"
                }
                return "Office Hours"
            case .Party(_):
                return "🍕 & 🎸 Party with Airplane Mode"
            }
        }
        
        var subtitle: String {
            switch self {
            case .Meetup(let event):
                return event.sponsor
            case .Workshop(let event):
                return event.sponsor
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
            case .Workshop(let event):
                return event.logo
            case .Meetup(let event):
                return event.logo
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
            case .Workshop(let event):
                return event.location
            case .Meetup(let event):
                return event.location
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
            case .Workshop(_), .Meetup(_):
                return "Special Event"
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
        
        var selectable: Bool {
            switch self {
            case .Workshop(_), .Meetup(_), .Talk(_), .OfficeHours(_), .Party(_):
                return true
            case .CoffeeBreak(let sponsor):
                if sponsor != nil {
                    return true
                }
                return false
            default:
                return false
            }
        }
    }
}

// default data
extension Session {
    
    static let sessionsAug31: [[Session]] = [
        [{
            let event = Event(
                title: "FREE Swift Workshop",
                sponsor: "General Assembly",
                logo: "ga_trimmed",
                location: "10 East 21st Street",
                website: NSURL(string: "https://generalassemb.ly/education/try-swift-workshop/new-york-city/27431")!)
            
            let session = Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 8, day: 31, hour: 16, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                info: .Workshop(event)
            )
            
            return session
            }()],

    ]
    
    static let sessionsSept1: [[Session]] = [
        [{
            let title = "Breakfast & Registration"
            let session = Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 8, minute: 45, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 9, minute: 45, second: 0),
                info: .Breakfast(title)
            )
            
            return session
        }()],
        [{
            let title = "Opening Remarks"
            let session = Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 9, minute: 45, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                info: .Announcement(title)
            )
            
            return session
        }()],
        [{
            let realm = try! Realm()
            var presentation = realm.objects(Presentation.self).filter("id == 4").first ?? defaultPresentations[3]
            
            let session = Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
        }()],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 5").first ?? defaultPresentations[4]
            
            let session = Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 4").first ?? defaultPresentations[3]
                
                let session = Session(
                    id: 201,
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                info: .CoffeeBreak(Sponsor.goldSponsors[2]))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 6").first ?? defaultPresentations[5]
            
            let session = Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 5").first ?? defaultPresentations[4]
                
                let session = Session(
                    id: 201,
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
    
    ]
    
    static let sessionsSept2: [[Session]] = [
        [{
            let title = "☕️ & Breakfast"
            let session = Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 9, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 9, minute: 45, second: 0),
                info: .Breakfast(title)
            )
            
            return session
        }()],
        [{
            let title = "Opening Remarks"
            let session = Session(
                id: 201,
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 9, minute: 45, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 10, minute: 0, second: 0),
                info: .Announcement(title)
            )
            
            return session
        }()]
    ]
}
