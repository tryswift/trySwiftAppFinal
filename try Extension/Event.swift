//
//  Event.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/20/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct Event {
    let title: String
    let sponsor: Sponsor
}

extension Event {
    
    static let gaWorkshop = Event(
        title: "FREE Swift Workshop",
        sponsor: Sponsor.ga)
    
    static let meetup = Event(
        title: "Pre-conference Meetup",
        sponsor: Sponsor.meetup)
}
