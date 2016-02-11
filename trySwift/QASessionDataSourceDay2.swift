//
//  QASessionDataSourceDay2.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//


struct QASessionDataSourceDay2: QASessionDataSourceProtocol {
    var header = isJapanese ? "3月3日（木）" : "Thu, Mar 3"
    var qaSessions = QASession.qaSessionsDay2
}