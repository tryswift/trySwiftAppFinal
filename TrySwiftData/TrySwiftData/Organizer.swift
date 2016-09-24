//
//  Organizer.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

public struct Organizer {
    public let name: String
    public let twitter: String
    public let image: UIImage
    public let bio: String
}

public extension Organizer {
    
    public static let organizers = [
        Organizer(name: "Natasha Murashev",
            twitter: "NatashaTheRobot",
            image: UIImage(named: "natasha_murashev")!,
            bio: "Natasha is an iOS developer by day and a robot by night. She blogs about Swift, WatchOS, and iOS development on her blog, natashatherobot.com, curates a fast-growing weekly Swift newsletter, This Week in Swift, and organizes the try! Swift Conference around the world (including this one!). She's currently living the digital nomad life as her alter identity: @NatashaTheNomad.")
    ]
}
