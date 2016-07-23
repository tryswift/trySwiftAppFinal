//
//  QASessionDataSourceDay1.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Timepiece

struct QASessionDataSourceDay1: QASessionDataSourceProtocol {
    var header = isJapanese ? "3月2日（水）" : "Thu, Sep 1"
    var qaSessions = QASession.qaSessions(forDate: NSDate.date(year: 2016, month: 09, day: 01))
}
