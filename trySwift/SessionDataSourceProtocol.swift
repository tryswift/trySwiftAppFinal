//
//  SessionDataSourceProtocol.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation

protocol SessionDataSourceProtocol {
    var header: String { get }
    var sessions: [Session] { get }
}
