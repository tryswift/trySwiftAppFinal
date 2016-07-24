//
//  SessionDataSourceDay1.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Timepiece

struct SessionDataSourceDay1: SessionDataSourceProtocol {
    var header = isJapanese ? "3月2日（水）" : "Wed, Aug 31"
    var sessions = Session.sessions(for: .date(year: 2016, month: 08, day: 31))
}
