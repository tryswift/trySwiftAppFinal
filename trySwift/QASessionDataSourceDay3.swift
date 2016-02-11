//
//  QASessionDataSourceDay3.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct QASessionDataSourceDay3: QASessionDataSourceProtocol {
    var header = isJapanese ? "3月4日（金）" : "Fri, Mar 4"
    var qaSessions = QASession.qaSessionsDay3
}