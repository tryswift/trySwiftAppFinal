//
//  Presentation.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Freddy

struct Presentation {
    let title: String
    let summary: String
}

extension Presentation: JSONDecodable {
    
    init(json: JSON) throws {
        self.title = try json.string("title")
        self.summary = try json.string("summary")
    }
}