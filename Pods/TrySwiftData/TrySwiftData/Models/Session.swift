//
//  Session.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public enum SessionType: Int {
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
    case registration
    case panel
}

public struct Session {
    /** The type of content in this particular session */
    public let type: SessionType

    /** The title of this session (if not provided by any child objects) */
    public let title: String?

    /** The Japanese title of this session (if not provided by any child objects) */
    public let titleJP: String?

    /** For special cases, the name of the image to show for this session. */
    public let imageAssetName: String?

    /** A sponsor, if any, responsible for this session. */
    public let sponsor: Sponsor?

    /** The presentation information if this session is a talk. */
    public let presentation: Presentation?

    /** The specific room this session will be held */
    public let location: Location?

    /** A special type of event occuring during the conference */
    public let event: Event?

    /** Any particular events held at a different venue from the conference */
    public let venue: Venue?

    /***************************************************/

    init(type: SessionType,
         title: String? = nil,
         titleJP: String? = nil,
         imageAssetName: String? = nil,
         sponsor: Sponsor? = nil,
         presentation: Presentation? = nil,
         location: Location? = nil,
         event: Event? = nil,
         venue: Venue? = nil
        ) {
        self.type = type
        self.title = title
        self.titleJP = titleJP
        self.imageAssetName = imageAssetName
        self.sponsor = sponsor
        self.presentation = presentation
        self.location = location
        self.event = event
        self.venue = venue
    }
    
    public static var all: [String: Session] {
        return nyc2019Sessions
    }
}
