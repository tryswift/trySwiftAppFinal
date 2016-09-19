//
//  Event.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct Event {
    let title: String
    let sponsor: String
    let logo: String
    let location: String
    let website: URL
}

extension Event {
    
    static let gaWorkshop = Event(
        title: "FREE Swift Workshop",
        sponsor: "General Assembly",
        logo: "ga_trimmed",
        location: "10 East 21st Street, New York",
        website: URL(string: "https://generalassemb.ly/education/try-swift-workshop/new-york-city/27431")!)
    
    static let meetup = Event(
        title: "Pre-conference Meetup",
        sponsor: "Meetup",
        logo: "meetup-square",
        location: "632 Broadway, New York",
        website: URL(string: "http://www.meetup.com/Tech-Talks-at-Meetup/events/233150456/")!)
}
