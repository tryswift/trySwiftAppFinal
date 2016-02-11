//
//  SessionDataSourceDay2.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct SessionDataSourceDay2: SessionDataSourceProtocol {
    var header = isJapanese ? "3月3日（木）" : "Thu, Mar 3"
    var sessions = Session.sessionsDay2
}
