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
        let flags: NSCalendarUnit = [.Year, .Month, .Day]
        let components1 = NSCalendar.currentCalendar().components(flags, fromDate: startTime)
        let components2 = NSCalendar.currentCalendar().components(flags, fromDate: date)
        
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
}
