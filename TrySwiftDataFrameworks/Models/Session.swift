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
    public let index: Int?
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
                return event.sponsor.name
            case .workshop(let event):
                return event.sponsor.name
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
        
        public var twitter: String {
            switch self {
            case .workshop(let event):
                guard let twitter = event.sponsor.twitter else {
                    return ""
                }
                return "@\(twitter)"
            case .meetup(let event):
                guard let twitter = event.sponsor.twitter else {
                    return ""
                }
                return "@\(twitter)"
            case .coffeeBreak(let sponsor):
                if let sponsor = sponsor {
                    return "@\(sponsor.twitter)"
                }
                return "tryswiftnyc"
            case .talk(let presentation):
                let twitterHandle = presentation.speaker?.twitter ?? "tryswiftnyc"
                return "@\(twitterHandle)"
            case .sponsoredDemo(let sponsor):
                return "@\(sponsor.twitter)"
            default:
                return "@tryswiftnyc"
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
                info: .workshop(Event.gaWorkshop),
                index: 0)
            }()],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 8, day: 31, hour: 19, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 21, minute: 15, second: 0),
                info: .workshop(Event.meetup),
                index: 1)
            }()]
        
    ]
    
    // MARK: September 1 Schedule
    static let sessionsSept1: [[Session]] = [
        [{
            let title = "Breakfast & Registration"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 8, minute: 45, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 9, minute: 45, second: 0),
                info: .breakfast(title),
                index: 2
            )
            
            return session
        }()],
        [{
            let title = "Opening Remarks"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 9, minute: 45, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                info: .announcement(title),
                index: 3
            )
            
            return session
        }()],
        [{
            let realm = try! Realm()
            var presentation = realm.objects(Presentation.self).filter("id == 3").first ?? defaultPresentations[2]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                info: .talk(presentation),
                index: 4
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 20").first ?? defaultPresentations[19]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 5
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 3").first ?? defaultPresentations[2]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 10, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                info: .coffeeBreak(Sponsor.goldSponsors[2]),
                index: 6)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 12").first ?? defaultPresentations[11]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                info: .talk(presentation),
                index: 7
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 5").first ?? defaultPresentations[4]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 11, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 8
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 12").first ?? defaultPresentations[11]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 9
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 11").first ?? defaultPresentations[10]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 12, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 13, minute: 15, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 13, minute: 15, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                info: .lunch,
                index: 10)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 14").first ?? defaultPresentations[13]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                info: .talk(presentation),
                index: 11
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 19").first ?? defaultPresentations[18]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 14, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 12
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 14").first ?? defaultPresentations[13]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 13
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 2").first ?? defaultPresentations[1]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 15, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                info: .coffeeBreak(nil),
                index: 14)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 1").first ?? defaultPresentations[0]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                info: .talk(presentation),
                index: 15
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 4").first ?? defaultPresentations[3]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 16, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 16
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 1").first ?? defaultPresentations[0]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 17
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 10").first ?? defaultPresentations[9]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 1, hour: 17, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()
        ],
        [{
            let title = "Closing Announcements"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 1, hour: 18, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 1, hour: 18, minute: 30, second: 0),
                info: .announcement(title),
                index: 18
            )
            
            return session
            }()
        ],
        [{
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 20, minute: 30, second: 0),
                info: .party(Venue.americanBeauty),
                index: 19
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
                info: .breakfast(title),
                index: 20
            )
            
            return session
        }()],
        [{
            let title = "Opening Remarks"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 9, minute: 45, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 0, second: 0),
                info: .announcement(title),
                index: 21
            )
            
            return session
        }()],
        [{
            let realm = try! Realm()
            var presentation = realm.objects(Presentation.self).filter("id == 21").first ?? defaultPresentations[20]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                info: .talk(presentation),
                index: 22
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 8").first ?? defaultPresentations[7]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 7").first ?? defaultPresentations[6]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                info: .talk(presentation),
                index: 23
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                var presentation = realm.objects(Presentation.self).filter("id == 21").first ?? defaultPresentations[20]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 10, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                info: .coffeeBreak(Sponsor.goldSponsors[2]),
                index: 24)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 13").first ?? defaultPresentations[12]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                info: .talk(presentation),
                index: 25
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 7").first ?? defaultPresentations[6]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 11, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 26
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 13").first ?? defaultPresentations[12]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 27
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 16").first ?? defaultPresentations[15]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 12, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                info: .sponsoredDemo(Sponsor.goldSponsors.last!),
                index: 28)
            }(),
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 13, minute: 15, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                info: .lunch,
                index: 29)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 9").first ?? defaultPresentations[8]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                info: .talk(presentation),
                index: 30
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 15").first ?? defaultPresentations[14]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 14, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 31
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 9").first ?? defaultPresentations[8]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 32
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 22").first ?? defaultPresentations[21]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 15, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()
        ],
        [{
            return Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                info: .coffeeBreak(nil),
                index: 33)
            }()
        ],
        [{
            let realm = try! Realm()
            let presentation = realm.objects(Presentation.self).filter("id == 17").first ?? defaultPresentations[16]
            
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                info: .talk(presentation),
                index: 34
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 18").first ?? defaultPresentations[17]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 16, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 35
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 17").first ?? defaultPresentations[16]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 0, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                    info: .officeHours(presentation),
                    index: nil
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
                info: .talk(presentation),
                index: 36
            )
            
            return session
            }(),
            {
                let realm = try! Realm()
                let presentation = realm.objects(Presentation.self).filter("id == 6").first ?? defaultPresentations[5]
                
                let session = Session(
                    startTime: Date.date(year: 2016, month: 9, day: 2, hour: 17, minute: 30, second: 0),
                    endTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 0, second: 0),
                    info: .officeHours(presentation),
                    index: nil
                )
                
                return session
            }()
        ],
        [{
            let title = "Closing Announcements"
            let session = Session(
                startTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 0, second: 0),
                endTime: Date.date(year: 2016, month: 9, day: 2, hour: 18, minute: 30, second: 0),
                info: .announcement(title),
                index: 37
            )
            
            return session
            }()
        ]
    ]
}


// taken from https://github.com/naoty/Timepiece

fileprivate extension Date {
    
    // MARK: - Get components
    
    var year: Int {
        return components.year!
    }
    
    var month: Int {
        return components.month!
    }
    
    var weekday: Int {
        return components.weekday!
    }
    
    var day: Int {
        return components.day!
    }
    
    var hour: Int {
        return components.hour!
    }
    
    var minute: Int {
        return components.minute!
    }
    
    var second: Int {
        return components.second!
    }
    
    fileprivate var calendar: Calendar {
        return Calendar.current
    }
    
    fileprivate var components: DateComponents {
        return (calendar as NSCalendar).components([.year, .month, .weekday, .day, .hour, .minute, .second], from: self)
    }
    
    static func date(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date {
        let now = Date()
        return now.change(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }
    
    static func date(year: Int, month: Int, day: Int) -> Date {
        return Date.date(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }
    
    /**
     Initialize a date by changing date components of the receiver.
     */
    func change(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date! {
        var components = self.components
        components.year = year ?? self.year
        components.month = month ?? self.month
        components.day = day ?? self.day
        components.hour = hour ?? self.hour
        components.minute = minute ?? self.minute
        components.second = second ?? self.second
        return calendar.date(from: components)
    }
}
