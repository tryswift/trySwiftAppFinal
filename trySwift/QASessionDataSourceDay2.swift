//
//  QASessionDataSourceDay2.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Timepiece

struct QASessionDataSourceDay2: QASessionDataSourceProtocol {
    var header = "Fri, Sep 2"
    var qaSessions = QASession.qaSessions(forDate: NSDate.date(year: 2016, month: 09, day: 02))
}
