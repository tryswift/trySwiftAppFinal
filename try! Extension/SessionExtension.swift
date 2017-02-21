//
//  SessionExtension.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/21/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import TrySwiftData
import Foundation
import Timepiece

extension SessionBlock {
    
    var timeString: String {
        return "\(startTime.timeString(in: .short)) - \(endTime.timeString(in: .short))"
    }
}
