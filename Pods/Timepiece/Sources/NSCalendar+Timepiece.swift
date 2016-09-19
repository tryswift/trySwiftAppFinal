//
//  NSCalendar+Timepiece.swift
//  Timepiece
//
//  Created by Mattijs on 25/04/15.
//  Copyright (c) 2015 Naoto Kaneko. All rights reserved.
//

import Foundation

extension Calendar {
    func dateByAddingDuration(_ duration: Duration, toDate date: Date, options opts: NSCalendar.Options) -> Date? {
        return self.date(byAdding: DateComponents(duration), to: date)
    }
}
