//
//  SessionDataSourceDay3.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//


struct SessionDataSourceDay3: SessionDataSourceProtocol {
    var header = isJapanese ? "3月4日（金）" : "Fri, Mar 4"
    var sessions = Session.sessionsDay3
}
