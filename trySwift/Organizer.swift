//
//  Organizer.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan

struct Organizer {
    let name: String
    let twitter: String
    let image: UIImage
    let bio: String
}

extension Organizer {
    
    static let organizers = [
        Organizer(name: "Natasha Murashev",
            twitter: "NatashaTheRobot",
            image: UIImage(named: "natasha_murashev")!,
            bio: "Natasha is an iOS developer by day and a robot by night. She blogs about Swift, WatchOS, and iOS development on her blog, natashatherobot.com, curates a fast-growing weekly Swift newsletter, This Week in Swift, and organizes the try! Swift Conference around the world (including this one!). She's currently living the digital nomad life as her alter identity: @NatashaTheNomad.")
    ]
}
