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
        case SponsoredDemo(Sponsor)
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
            case .SponsoredDemo(_):
                return "Sponsored Demo"
            case .CoffeeBreak(let sponsor):
                if let sponsor = sponsor {
                    return "☕️ Break, by \(sponsor.name)"
                }
                return "☕️ Break"
            case .Lunch:
                return "😋 Lunch"
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
            case .SponsoredDemo(let sponsor):
                return sponsor.name
            case .CoffeeBreak(let sponsor):
                if let sponsor = sponsor {
                    return sponsor.name
                } else {
                    return "try! NYC Conference"
                }
            case .OfficeHours(let presentation):
                return presentation.speaker?.name ?? "⁉️"
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
            case .Breakfast(_), .Lunch, .Announcement(_):
                return "tryLogo"
            case .CoffeeBreak(let sponsor):
                if sponsor != nil {
                    // currently, the only sponsor is DOMO
                    return "domo"
                }
                return "tryLogo"
            case .Talk(let presentation):
                return presentation.speaker?.imageName ?? "tryLogo"
            case .OfficeHours(let presentation):
                return presentation.speaker?.imageName ?? "tryLogo"
            case .SponsoredDemo(_):
                // currently the only sponsor is Twilio
                return "twilio-small"
            case .Party(_):
                return "airplanemode-short"
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
            case .Announcement(_), .Talk(_), .SponsoredDemo(_):
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
            case .SponsoredDemo(_):
                return "Demo"
            case .OfficeHours(_):
                return "Q&A"
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
    
    // MARK: August 31 Schedule
    static let sessionsAug31: [[Session]] = [
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 8, day: 31, hour: 16, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                info: .Workshop(Event.gaWorkshop))
            }()],
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 8, day: 31, hour: 19, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 21, minute: 15, second: 0),
                info: .Workshop(Event.meetup))
            }()]
        
    ]
    
    // MARK: September 1 Schedule
    static let sessionsSept1: [[Session]] = [
        [{
            let title = "Breakfast & Registration"
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 8, minute: 45, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 9, minute: 45, second: 0),
                info: .Breakfast(title)
            )
            
            return session
        }()],
        [{
            let title = "Opening Remarks"
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 9, minute: 45, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                info: .Announcement(title)
            )
            
            return session
        }()],
        [{
            let realm = try! Realm()
            var presentation = realm.objects(Presentation.self).filter("id == 3").first ?? defaultPresentations[2]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 20").first ?? defaultPresentations[19]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 5").first ?? defaultPresentations[4]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 3").first ?? defaultPresentations[2]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                info: .CoffeeBreak(Sponsor.goldSponsors[2]))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 12").first ?? defaultPresentations[11]
            
            let session = Session(
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
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 11").first ?? defaultPresentations[10]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 12").first ?? defaultPresentations[11]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 19").first ?? defaultPresentations[18]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 13, minute: 15, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 11").first ?? defaultPresentations[10]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 13, minute: 15, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 13, minute: 15, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                info: .Lunch)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 14").first ?? defaultPresentations[13]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 19").first ?? defaultPresentations[18]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 2").first ?? defaultPresentations[1]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 14").first ?? defaultPresentations[13]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 4").first ?? defaultPresentations[3]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 16, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 2").first ?? defaultPresentations[1]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 16, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 16, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                info: .CoffeeBreak(nil))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 1").first ?? defaultPresentations[0]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 4").first ?? defaultPresentations[3]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 10").first ?? defaultPresentations[9]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 1").first ?? defaultPresentations[0]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 8").first ?? defaultPresentations[7]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 10").first ?? defaultPresentations[9]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let title = "Closing Announcements"
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 1, hour: 18, minute: 30, second: 0),
                info: .Announcement(title)
            )
            
            return session
            }()
        ],
        [{
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 18, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 20, minute: 30, second: 0),
                info: .Party(Venue.americanBeauty)
            )
            
            return session
            }()
        ]
        
        
    ]

    // MARK: September 2 Schedule
    static let sessionsSept2: [[Session]] = [
        [{
            let title = "☕️ & Breakfast"
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 9, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 9, minute: 45, second: 0),
                info: .Breakfast(title)
            )
            
            return session
        }()],
        [{
            let title = "Opening Remarks"
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 9, minute: 45, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 10, minute: 0, second: 0),
                info: .Announcement(title)
            )
            
            return session
        }()],
        [{
            let realm = try! Realm()
            var presentation = realm.objects(Presentation.self).filter("id == 21").first ?? defaultPresentations[20]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 10, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 8").first ?? defaultPresentations[7]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 7").first ?? defaultPresentations[6]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                var presentation = realm.objects(Presentation.self).filter("id == 21").first ?? defaultPresentations[20]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                info: .CoffeeBreak(Sponsor.goldSponsors[2]))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 13").first ?? defaultPresentations[12]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 7").first ?? defaultPresentations[6]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 16").first ?? defaultPresentations[15]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 13").first ?? defaultPresentations[12]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 15").first ?? defaultPresentations[14]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 13, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 16").first ?? defaultPresentations[15]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 13, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                info: .SponsoredDemo(Sponsor.goldSponsors[6])
            )
            }(),
        ],
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                info: .Lunch)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 9").first ?? defaultPresentations[8]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 15").first ?? defaultPresentations[14]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 22").first ?? defaultPresentations[21]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 9").first ?? defaultPresentations[8]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 18").first ?? defaultPresentations[17]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 16, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 22").first ?? defaultPresentations[21]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 16, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 16, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                info: .CoffeeBreak(nil))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 17").first ?? defaultPresentations[16]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 18").first ?? defaultPresentations[17]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 6").first ?? defaultPresentations[5]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 17").first ?? defaultPresentations[16]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 20").first ?? defaultPresentations[19]
            
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 18, minute: 0, second: 0),
                info: .Talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 6").first ?? defaultPresentations[5]
                
                let session = Session(
                    startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                    endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 18, minute: 0, second: 0),
                    info: .OfficeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let title = "Closing Announcements"
            let session = Session(
                startTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 18, minute: 0, second: 0),
                endTime: NSDate.date(year: 2016, month: 9, day: 2, hour: 18, minute: 30, second: 0),
                info: .Announcement(title)
            )
            
            return session
            }()
        ]
    ]
}
