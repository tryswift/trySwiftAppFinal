//
//  Session.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation

struct Session {

    enum SessionType {
        case Presentation, Announcement, Coffee, Meal, Event
    }
    
    let title: String
    let subtitle: String?
    let sessionType: SessionType
    
    let date: NSDate
    let index: Int
}


