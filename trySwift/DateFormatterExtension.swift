//
//  DateFormatterExtension.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/22/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let sessionDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "**Session.Time**".localized()
        return dateFormatter
    }()
    
    static let dayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "**Conference.Date**".localized()
        return dateFormatter
    }()
}
