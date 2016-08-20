//
//  Sponsor.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/20/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct Sponsor {
    let name: String
    let logo: String
    let twitter: String
}

extension Sponsor {
    
    static let domo = Sponsor(
        name: "Domo",
        logo: "domo",
        twitter: "Domotalk")
    
    static let twilio = Sponsor(
        name: "Twilio",
        logo: "twilio",
        twitter: "twilio")
    
    static let ga = Sponsor(
        name: "General Assembly",
        logo: "ga_trimmed",
        twitter: "GA")
    
    static let meetup = Sponsor(
        name: "Meetup",
        logo: "meetup-square",
        twitter: "Meetup")
}
