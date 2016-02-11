//
//  QASessionDataSourceDay1.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//


struct QASessionDataSourceDay1: QASessionDataSourceProtocol {
    var header = isJapanese ? "3月2日（水）" : "Wed, Mar 2"
    var qaSessions = QASession.qaSessionsDay1
}

