//
//  QASessionDataSourceDay2.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct QASessionDataSourceDay2: QASessionDataSourceProtocol {
    var header = isJapanese ? "3月3日（木）" : "Fri, Sep 2"
    var qaSessions = QASession.qaSessions
}
