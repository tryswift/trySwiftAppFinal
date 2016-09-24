//
//  Timeslot.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import RealmSwift

public struct Session {
    public let startTime: Date
    public let endTime: Date
    public let info: Info
}

// date / time formatting
public extension Session {
    
    var timeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        return "\(dateFormatter.string(from: startTime)) - \(dateFormatter.string(from: endTime))"
    }
    
    var dateTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE hhmm")
        let startTime = dateFormatter.string(from: self.startTime)
        
        dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm")
        let endTime = dateFormatter.string(from: self.endTime)
        return "\(startTime) - \(endTime)"
    }
}

// Description Details
public extension Session {
    
    public enum Info: CustomStringConvertible {

        case workshop(Event)
        case meetup(Event)
        case breakfast(String)
        case announcement(String)
        case talk(Presentation)
        case sponsoredDemo(Sponsor)
        case coffeeBreak(Sponsor?)
        case lunch
        case officeHours(Presentation)
        case party(Venue)
        
        public var title: String {
            switch self {
            case .workshop(let event):
                return event.title
            case .meetup(let event):
                return event.title
            case .breakfast(let title):
                return title
            case .announcement(let title):
                return title
            case .talk(let presentation):
                return presentation.title
            case .sponsoredDemo(_):
                return "Sponsored Demo"
            case .coffeeBreak(let sponsor):
                if let sponsor = sponsor {
                    return "☕️ Break, by \(sponsor.name)"
                }
                return "☕️ Break"
            case .lunch:
                return "🍴 Lunch"
            case .officeHours(let presentation):
                if let speaker = presentation.speaker?.name {
                    return "Office Hours with \(speaker)"
                }
                return "Office Hours"
            case .party(_):
                return "🍕 & 🎸 Party with Airplane Mode"
            }
        }
        
        public var subtitle: String {
            switch self {
            case .meetup(let event):
                return event.sponsor
            case .workshop(let event):
                return event.sponsor
            case .breakfast(_), .announcement(_), .lunch:
                return "try! NYC Conference"
            case .talk(let presentation):
                return presentation.speaker?.name ?? "try! NYC Conference"
            case .sponsoredDemo(let sponsor):
                return sponsor.name
            case .coffeeBreak(let sponsor):
                if let sponsor = sponsor {
                    return sponsor.name
                } else {
                    return "try! NYC Conference"
                }
            case .officeHours(let presentation):
                return presentation.speaker?.name ?? "⁉️"
            case .party(_):
                return "Perfect.org"
            }
        }
        
        public var logo: UIImage {
            let defaultImage = UIImage(named: "tryLogo")!
            switch self {
            case .workshop(let event):
                return UIImage(named: event.logo)!
            case .meetup(let event):
                return UIImage(named: event.logo)!
            case .breakfast(_), .lunch, .announcement(_):
                return defaultImage
            case .coffeeBreak(let sponsor):
                if sponsor != nil {
                    // currently, the only sponsor is DOMO
                    return UIImage(named: "domo")!
                }
                return defaultImage
            case .talk(let presentation):
                return presentation.speaker?.getImage() ?? defaultImage
            case .officeHours(let presentation):
                return presentation.speaker?.getImage() ?? defaultImage
            case .sponsoredDemo(_):
                // currently the only sponsor is Twilio
                return UIImage(named: "twilio-small")!
            case .party(_):
                return UIImage(named: "airplanemode-short")!
            }
        }
        
        public var location: String {
            switch self {
            case .workshop(let event):
                return event.location
            case .meetup(let event):
                return event.location
            case .breakfast(_), .coffeeBreak(_), .lunch:
                return "North Lobby"
            case .announcement(_), .talk(_), .sponsoredDemo(_):
                return "Auditorium"
            case .officeHours(_):
                return "Atrium"
            case .party(let venue):
                return venue.address
            }
        }
        
        public var description: String {
            switch self {
            case .workshop(_), .meetup(_):
                return "Special Event"
            case .breakfast(_), .coffeeBreak(_), .lunch:
                return "❤️"
            case .announcement(_):
                return "📣"
            case .talk(_):
                return "Presentation"
            case .sponsoredDemo(_):
                return "Demo"
            case .officeHours(_):
                return "Q&A"
            case .party(_):
                return "🎉🎉🎉"
            }
        }
        
        public var selectable: Bool {
            switch self {
            case .workshop(_), .meetup(_), .talk(_), .officeHours(_), .party(_), .sponsoredDemo(_):
                return true
            case .coffeeBreak(let sponsor):
                return sponsor != nil
            default:
                return false
            }
        }
    }
}

// default data
public extension Session {
    
    // MARK: August 31 Schedule
    static let sessionsAug31: [[Session]] = [
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 8, day: 31, hour: 16, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                info: .workshop(Event.gaWorkshop))
            }()],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 8, day: 31, hour: 19, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 21, minute: 15, second: 0),
                info: .workshop(Event.meetup))
            }()]
        
    ]
    
    // MARK: September 1 Schedule
    static let sessionsSept1: [[Session]] = [
        [{
            let title = "Breakfast & Registration"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 8, minute: 45, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 9, minute: 45, second: 0),
                info: .breakfast(title)
            )
            
            return session
        }()],
        [{
            let title = "Opening Remarks"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 9, minute: 45, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                info: .announcement(title)
            )
            
            return session
        }()],
        [{
            let realm = try! Realm()
            var presentation = realm.objects(Presentation.self).filter("id == 3").first ?? defaultPresentations[2]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 20").first ?? defaultPresentations[19]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 5").first ?? defaultPresentations[4]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 3").first ?? defaultPresentations[2]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                info: .coffeeBreak(Sponsor.goldSponsors[2]))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 12").first ?? defaultPresentations[11]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 5").first ?? defaultPresentations[4]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 11").first ?? defaultPresentations[10]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 12").first ?? defaultPresentations[11]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 19").first ?? defaultPresentations[18]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 13, minute: 15, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 11").first ?? defaultPresentations[10]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 13, minute: 15, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 13, minute: 15, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                info: .lunch)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 14").first ?? defaultPresentations[13]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 19").first ?? defaultPresentations[18]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 2").first ?? defaultPresentations[1]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 14").first ?? defaultPresentations[13]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 4").first ?? defaultPresentations[3]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 2").first ?? defaultPresentations[1]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                info: .coffeeBreak(nil))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 1").first ?? defaultPresentations[0]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 4").first ?? defaultPresentations[3]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 10").first ?? defaultPresentations[9]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 1").first ?? defaultPresentations[0]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 8").first ?? defaultPresentations[7]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 10").first ?? defaultPresentations[9]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let title = "Closing Announcements"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 18, minute: 30, second: 0),
                info: .announcement(title)
            )
            
            return session
            }()
        ],
        [{
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 20, minute: 30, second: 0),
                info: .party(Venue.americanBeauty)
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
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 9, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 9, minute: 45, second: 0),
                info: .breakfast(title)
            )
            
            return session
        }()],
        [{
            let title = "Opening Remarks"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 9, minute: 45, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 0, second: 0),
                info: .announcement(title)
            )
            
            return session
        }()],
        [{
            let realm = try! Realm()
            var presentation = realm.objects(Presentation.self).filter("id == 21").first ?? defaultPresentations[20]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 8").first ?? defaultPresentations[7]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 7").first ?? defaultPresentations[6]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                var presentation = realm.objects(Presentation.self).filter("id == 21").first ?? defaultPresentations[20]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                info: .coffeeBreak(Sponsor.goldSponsors[2]))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 13").first ?? defaultPresentations[12]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 7").first ?? defaultPresentations[6]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 16").first ?? defaultPresentations[15]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 13").first ?? defaultPresentations[12]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 15").first ?? defaultPresentations[14]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 16").first ?? defaultPresentations[15]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                info: .sponsoredDemo(Sponsor.goldSponsors.last!)
            )
            }(),
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                info: .lunch)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 9").first ?? defaultPresentations[8]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 15").first ?? defaultPresentations[14]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 22").first ?? defaultPresentations[21]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 9").first ?? defaultPresentations[8]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 18").first ?? defaultPresentations[17]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 22").first ?? defaultPresentations[21]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                info: .coffeeBreak(nil))
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 17").first ?? defaultPresentations[16]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 18").first ?? defaultPresentations[17]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 6").first ?? defaultPresentations[5]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 17").first ?? defaultPresentations[16]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 20").first ?? defaultPresentations[19]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 0, second: 0),
                info: .talk(presentation)
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 6").first ?? defaultPresentations[5]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 0, second: 0),
                    info: .officeHours(presentation)
                )
                
                return session
            }()
        ],
        [{
            let title = "Closing Announcements"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 30, second: 0),
                info: .announcement(title)
            )
            
            return session
            }()
        ]
    ]
}
