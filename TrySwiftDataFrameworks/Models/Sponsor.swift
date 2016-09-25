//
//  Sponsor.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

public struct Sponsor {
    
    public let name: String
    public let url: String
    public let displayURL: String
    public let twitter: String?
    public let logo: UIImage?
    public let level: Level
    
    public enum Level: Int, CustomStringConvertible {
        case platinum, gold, silver, diversity, student, event
        
        public var description: String {
            switch self {
            case .platinum:
                return "Platinum Sponsor"
            case .gold:
                return "Gold Sponsors"
            case .silver:
                return "Silver Sponsors"
            case .diversity:
                return "Diversity Sponsors"
            case .student:
                return "Student Sponsor"
            case .event:
                return "Event Partners"
            }
        }
    }
}

public extension Sponsor {
    
    static let platinumSponsors = [
        Sponsor(
            name: "IBM",
            url: "http://www.ibm.com/",
            displayURL: "ibm.com",
            twitter: "IBM",
            logo: UIImage(named: "ibm"),
            level: .platinum)
    ]
    
    static let goldSponsors = [
        Sponsor(
            name: "buddybuild",
            url: "https://buddybuild.com",
            displayURL: "buddybuild.com",
            twitter: "buddybuild",
            logo: UIImage(named: "buddybuild"),
            level: .gold),
        Sponsor(
            name: "contentful",
            url: "https://www.contentful.com",
            displayURL: "contentful.com",
            twitter: "contentful",
            logo: UIImage(named: "contentful"),
            level: .gold),
        Sponsor(
            name: "Domo",
            url: "https://www.domo.com",
            displayURL: "domo.com",
            twitter: "Domotalk",
            logo: UIImage(named: "domo"),
            level: .gold),
        Sponsor(
            name: "Firebase",
            url: "https://www.firebase.com/",
            displayURL: "firebase.com",
            twitter: "Firebase",
            logo: UIImage(named: "firebase"),
            level: .gold),
        Sponsor(
            name: "Hired",
            url: "https://hired.com/",
            displayURL: "hired.com",
            twitter: "Hired_HQ",
            logo: UIImage(named: "hired"),
            level: .gold),
        Sponsor(
            name: "Lyft",
            url: "https://www.lyft.com",
            displayURL: "lyft.com",
            twitter: "lyft",
            logo: UIImage(named: "lyft"),
            level: .gold),
        Sponsor(
            name: "Perfect.org",
            url: "https://perfect.org",
            displayURL: "perfect.org",
            twitter: "perfectlysoft",
            logo: UIImage(named: "perfectorg"),
            level: .gold),
        Sponsor(
            name: "ThoughtWorks",
            url: "https://www.thoughtworks.com",
            displayURL: "thoughtworks.com",
            twitter: "thoughtworks",
            logo: UIImage(named: "thoughtworks"),
            level: .gold),
        Sponsor(
            name: "Twilio",
            url: "https://www.twilio.com",
            displayURL: "twilio.com",
            twitter: "twilio",
            logo: UIImage(named: "twilio"),
            level: .gold)
    ]
    
    static let silverSponsors = [
        Sponsor(
            name: "Aol",
            url: "https://www.aol.com/",
            displayURL: "aol.com",
            twitter: "AOL",
            logo: UIImage(named: "aol"),
            level: .silver),
        Sponsor(
            name: "Small Planet",
            url: "https://www.smallplanet.com/",
            displayURL: "smallplanet.com",
            twitter: "smallplanetapps",
            logo: UIImage(named: "smallplanet"),
            level: .silver)
    ]
    
    static let diversitySponsors = [
        Sponsor(
            name: "Dominos",
            url: "https://www.dominos.com",
            displayURL: "dominos.com",
            twitter: "dominos",
            logo: UIImage(named: "dominos"),
            level: .diversity),
        Sponsor(
            name: "Etsy",
            url: "https://www.etsy.com",
            displayURL: "etsy.com",
            twitter: "Etsy",
            logo: UIImage(named: "etsy"),
            level: .diversity),
        Sponsor(
            name: "Instagram",
            url: "https://www.instagram.com",
            displayURL: "instagram.com",
            twitter: "instagram",
            logo: UIImage(named: "instagram"),
            level: .diversity),
        Sponsor(
            name: "Meetup",
            url: "https://www.meetup.com",
            displayURL: "meetup.com",
            twitter: "Meetup",
            logo: UIImage(named: "meetup"),
            level: .diversity),
        Sponsor(
            name: "The New York Times Developers",
            url: "https://developer.nytimes.com/",
            displayURL: "developer.nytimes.com",
            twitter: "nytdevs",
            logo: UIImage(named: "nyt"),
            level: .diversity),
        Sponsor(
            name: "Swift Studies",
            url: "http://www.swift-studies.com",
            displayURL: "swift-studies.com",
            twitter: "Swift_Studies",
            logo: UIImage(named: "swift_studies"),
            level: .diversity),
        Sponsor(
            name: "Technically Speaking",
            url: "https://tinyletter.com/techspeak",
            displayURL: "tinyletter.com/techspeak",
            twitter: "techspeakdigest",
            logo: UIImage(named: "technically_speaking"),
            level: .diversity),
        Sponsor(
            name: "thoughtbot",
            url: "https://thoughtbot.com/services/ios-development",
            displayURL: "thoughtbot.com",
            twitter: "thoughtbot",
            logo: UIImage(named: "thoughtbot"),
            level: .diversity),
        Sponsor(
            name: "Twitter",
            url: "https://twitter.com",
            displayURL: "twitter.com",
            twitter: "twitter",
            logo: UIImage(named: "twitter"),
            level: .diversity),
        Sponsor(
            name: "XO Group",
            url: "https://xogroupinc.com/",
            displayURL: "xogroupinc.com",
            twitter: "XOGroupInc",
            logo: UIImage(named: "xogroup"),
            level: .diversity)
    ]
    
    static let studentSponsors = [
        Sponsor(
            name: "JetBrains",
            url: "https://www.jetbrains.com",
            displayURL: "jetbrains.com",
            twitter: "jetbrains",
            logo: UIImage(named: "jetbrains"),
            level: .student)
    ]
    
    static let eventPartners = [
        Sponsor(
            name: "Airplane Mode",
            url: "http://airplanemo.de",
            displayURL: "airplanemo.de",
            twitter: "airplanemode",
            logo: UIImage(named: "airplane_mode"),
            level: .event),
        Sponsor(
            name: "General Assembly",
            url: "https://generalassemb.ly/",
            displayURL: "generalassemb.ly",
            twitter: "GA",
            logo: UIImage(named: "ga"),
            level: .event),
        Sponsor(
            name: "LiuLiShuo",
            url: "https://www.liulishuo.com",
            displayURL: "liulishuo.com",
            twitter: nil,
            logo: UIImage(named: "liulishuo"),
            level: .event),
        Sponsor(
            name: "Realm",
            url: "https://realm.io",
            displayURL: "realm.io",
            twitter: "realm",
            logo: UIImage(named: "realm"),
            level: .event),
        Sponsor(
            name: "SoundCloud",
            url: "https://soundcloud.com/",
            displayURL: "soundcloud.com",
            twitter: "SoundCloud",
            logo: UIImage(named: "soundcloud"),
            level: .event),
        Sponsor(
            name: "SpotHero",
            url: "https://spothero.com",
            displayURL: "spothero.com",
            twitter: "SpotHero",
            logo: UIImage(named: "spothero"),
            level: .event),
        Sponsor(
            name: "Stanfy",
            url: "https://stanfy.com",
            displayURL: "stanfy.com",
            twitter: "stanfy",
            logo: UIImage(named: "stanfy"),
            level: .event)
    ]
}
