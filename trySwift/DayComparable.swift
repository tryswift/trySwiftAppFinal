//
//  DayComparable.swift
//  trySwift
//
//  Created by Bas Broek on 4/17/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation

protocol DayFilterable {
    
    var startTime: NSDate { get }
}

extension DayFilterable {
    
    func sameDay(asDate date: NSDate) -> Bool {
        let currentCalendar = NSCalendar.currentCalendar()
        let flags: NSCalendarUnit = [.Year, .Month, .Day]
        let startTimeComponents = currentCalendar.components(flags, fromDate: startTime)
        let compareDateComponents = currentCalendar.components(flags, fromDate: date)
        
        return startTimeComponents.year == compareDateComponents.year && startTimeComponents.month == compareDateComponents.month && startTimeComponents.day == compareDateComponents.day
    }
}
