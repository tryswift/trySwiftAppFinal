//
//  SessionDataSourceDay2.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Timepiece

struct SessionDataSourceDay2: SessionDataSourceProtocol {
    var header = isJapanese ? "3月3日（木）" : "Fri, Sep 2"
    var sessions = Session.sessions(forDate: NSDate.date(year: 2016, month: 09, day: 02))
}
