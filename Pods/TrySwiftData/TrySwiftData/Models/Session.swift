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
}

public class Session {
    /** The type of content in this particular session */
    public var type: SessionType = .talk

    /** The title of this session (if not provided by any child objects) */
    public var title: String?

    /** The Japanese title of this session (if not provided by any child objects) */
    public var titleJP: String?

    /** For special cases, the name of the image to show for this session. */
    public var imageAssetName: String?

    /** For special cases, the name of the image to show for this session. */
    public var imageWebURL: String?

    /** A sponsor, if any, responsible for this session. */
    public var sponsor: Sponsor?

    /** The presentation information if this session is a talk. */
    public var presentation: Presentation?

    /** The specific room this session will be held */
    public var location: Location?

    /** A special type of event occuring during the conference */
    public var event: Event?

    /** Any particular events held at a different venue from the conference */
    public var venue: Venue?

    /***************************************************/

    public static var all: [String: Session] {
        return tko2018Sessions
    }
}
