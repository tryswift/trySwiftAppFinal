//
//  Session.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import RealmSwift

@objc public enum SessionType: Int {
    case workshop
    case meetup
    case breakfast
    case announcement
    case talk
    case lightningTalk
    case sponsoredDemo
    case coffeeBreak
    case lunch
    case officeHours
    case party
}

public class Session: Object {
    /** The type of content in this particular session */
    open dynamic var type: SessionType = .talk

    /** The title of this session (if not provided by any child objects) */
    open dynamic var title: String?

    /** The Japanese title of this session (if not provided by any child objects) */
    open dynamic var titleJP: String?

    /** For special cases, the name of the image to show for this session. */
    open dynamic var imageName: String?

    /** A sponsor, if any, responsible for this session. */
    open dynamic var sponsor: Sponsor?

    /** The presentation information if this session is a talk. */
    open dynamic var presentation: Presentation?

    /** The specific room this session will be held */
    open dynamic var location: Location?

    /** A special type of event occuring during the conference */
    open dynamic var event: Event?

    /** Any particular events held at a different venue from the conference */
    open dynamic var venue: Venue?

    /***************************************************/

    /** The main name of this session */
    public var formattedTitle: String {
        switch self.type {
        case .workshop, .meetup, .party:
            if let event = event {
                return event.localizedTitle
            }
            return ""
        case .talk:
            if let presentation = presentation {
                return presentation.title
            }
            return ""
        case .sponsoredDemo:
            return NSLocalizedString("Sponsored Demo", comment: "")
        case .coffeeBreak:
            if let sponsor = sponsor {
                return "☕️ Break, by \(sponsor.name)"
            }
            return "☕️ Break"
        case .lunch:
            return "🍴 Lunch"
        case .officeHours:
            if let speaker = presentation?.speaker?.name {
                return "Office Hours with \(speaker)"
            }
            return "Office Hours"
        default:
            return title ?? ""
        }
    }

    /** A follow-up tagline for the session */
    public var formattedSubtitle: String? {
        switch self.type {
        case .meetup, .workshop, .party:
            if let sponsor = sponsor {
                return sponsor.name
            }
            return ""
        case .talk:
            if let presentation = presentation {
                return presentation.speaker?.name ?? ""
            }
            return ""
        case .sponsoredDemo:
            return sponsor!.name
        case .coffeeBreak:
            if let sponsor = sponsor {
                return sponsor.name
            }
            return ""
        case .officeHours:
            if let presentation = presentation {
                return presentation.speaker?.name
            }
            return "⁉️"
        default:
            return ""
        }
    }

    /** What image, if any is available for this session */
    public var logo: UIImage {
        if let imageName = imageName {
            return UIImage(named: imageName)!
        }

        let defaultImage = UIImage(named: "tryLogo")!
        switch self.type {
        case .meetup:
            if let event = event {
                return UIImage(named: event.logo!)!
            }
            return defaultImage
        case .coffeeBreak:
            if sponsor != nil {
                return UIImage(named: sponsor!.logo!)!
            }
            return defaultImage
        case .talk:
            return presentation!.speaker?.getImage() ?? defaultImage
        case .officeHours:
            return presentation!.speaker?.getImage() ?? defaultImage
        case .sponsoredDemo():
            if sponsor != nil {
                return UIImage(named: sponsor!.logo!)!
            }
            return defaultImage
        default:
            return defaultImage
        }
    }

    /** The location for where this session will occur */
    public var formattedLocation: String {
        switch self.type {
        case .workshop, .meetup:
            return event!.location
        case .party:
            return venue!.address
        default:
            return location!.name
        }
    }

    /** A long-form description of the session */
    public var sessionDescription: String {
        switch self.type {
            case .workshop, .meetup:
                return "Special Event"
            case .breakfast, .coffeeBreak, .lunch:
                return "❤️"
            case .announcement:
                return "📣"
            case .talk:
                return "Presentation"
        case .lightningTalk:
                return "Lightning Talk"
            case .sponsoredDemo:
                return "Demo"
            case .officeHours:
                return "Q&A"
            case .party:
                return "🎉🎉🎉"
            }
    }

    /** Whether this type of session requires a new view controller to display more information */
    public var selectable: Bool {
        switch self.type {
        case .workshop, .meetup, .talk, .officeHours, .party, .sponsoredDemo:
            return true
        case .coffeeBreak:
            return sponsor != nil
        default:
            return false
        }
    }

    /** What Twitter handle, if any represents this session */
    public var twitter: String {
        switch self.type {
        case .workshop, .meetup:
            guard let twitter = sponsor!.twitter else {
                return ""
            }
            return "@\(twitter)"
        case .coffeeBreak:
            if let sponsor = sponsor {
                return "@\(sponsor.twitter)"
            }
            return ""
        case .talk:
            let twitterHandle = presentation!.speaker?.twitter ?? ""
            if !twitterHandle.isEmpty {
                return "@\(twitterHandle)"
            }
            return ""
        case .sponsoredDemo:
            return "@\(sponsor!.twitter)"
        default:
            return ""
        }
    }
}
