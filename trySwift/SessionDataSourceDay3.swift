//
//  SessionDataSourceDay3.swift
//  trySwift
//
//  Created by Bas Broek on 7/23/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import TrySwiftData

struct SessionDataSourceDay3: SessionDataSourceProtocol {
    var header = "Fri, Sep 2"
    var sessions = Session.sessionsSept2
}
