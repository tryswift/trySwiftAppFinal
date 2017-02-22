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
    open dynamic var imageAssetName: String?

    /** For special cases, the name of the image to show for this session. */
    open dynamic var imageWebURL: String?

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
    public var formattedTitle: String? {
        switch self.type {
        case .workshop, .meetup, .party:
            if let event = event {
                return event.localizedTitle
            }
            return nil
        case .talk, .lightningTalk:
            if let presentation = presentation {
                return presentation.localizedTitle
            }
            return nil
        case .sponsoredDemo:
            return "Sponsored Demo".localized()
        case .coffeeBreak:
            if let sponsor = sponsor {
                return String(format: "Coffee Break, by %@".localized(), sponsor.name)
            }
            return "Coffee Break".localized()
        case .lunch:
            return "Lunch".localized()
        case .officeHours:
            if let speaker = presentation?.speaker?.localizedName {
                return String(format: "Office Hours with %@".localized(), speaker)
            }
            return "Office Hours".localized()
        default:
            return localizedString(for: title ?? "", japaneseString: titleJP)
        }
    }

    /** A follow-up tagline for the session */
    public var formattedSubtitle: String? {
        switch self.type {
        case .meetup, .workshop, .party:
            if let sponsor = sponsor {
                return sponsor.localizedName
            }
            return nil
        case .talk, .lightningTalk:
            if let presentation = presentation {
                return presentation.speaker?.localizedName ?? ""
            }
            return nil
        case .sponsoredDemo:
            return sponsor!.localizedName
        case .coffeeBreak:
            if let sponsor = sponsor {
                return sponsor.localizedName
            }
            return nil
        case .officeHours:
            if let presentation = presentation {
                return presentation.speaker?.localizedName
            }
            return "⁉️"
        default:
            return nil
        }
    }

    /** What image, if any is available for this session */
    public var logoURL: URL {
        if let url = imageWebURL {
            return URL(string: url)!
        }

        let defaultImageURL = Bundle.trySwiftAssetURL(for: "Logo.png")!

        if let assetName = imageAssetName {
            return Bundle.trySwiftAssetURL(for: assetName) ?? defaultImageURL
        }

        switch self.type {
        case .meetup:
            if let event = event {
                return event.logoURL
            }
            return defaultImageURL
        case .coffeeBreak:
            if let sponsor = sponsor {
                return sponsor.logoURL
            }
            return defaultImageURL
        case .talk, .lightningTalk:
            return presentation!.speaker?.imageURL ?? defaultImageURL
        case .officeHours:
            return presentation!.speaker?.imageURL ?? defaultImageURL
        case .sponsoredDemo():
            if let sponsor = sponsor {
                return sponsor.logoURL
            }
            return defaultImageURL
        default:
            return defaultImageURL
        }
    }

    /** The location for where this session will occur */
    public var formattedLocation: String {
        switch self.type {
        case .workshop, .meetup:
            if let event = event {
                return event.localizedLocation
            }

            return location!.localizedName
        case .party:
            return venue!.localizedAddress
        default:
            return location!.localizedName
        }
    }

    /** A long-form description of the session */
    public var sessionDescription: String {
        switch self.type {
            case .workshop, .meetup:
                return "Special Event".localized()
            case .breakfast, .coffeeBreak, .lunch:
                return "❤️".localized()
            case .announcement:
                return "📣".localized()
            case .talk:
                return "Presentation".localized()
        case .lightningTalk:
                return "⚡️🎤 Lightning Talk".localized()
            case .sponsoredDemo:
                return "Demo".localized()
            case .officeHours:
                return "Q&A".localized()
            case .party:
                return "🎉🎉🎉".localized()
            }
    }

    /** Presentation Summary */
    public var presentationSummary: String {
        switch self.type {

        case .talk, .lightningTalk:
            return presentation!.localizedSummary
        default : return Conference.current.localizedDescription
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
