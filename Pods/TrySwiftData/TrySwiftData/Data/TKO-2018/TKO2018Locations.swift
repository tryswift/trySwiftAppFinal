//
//  TKO2018Locations.swift
//  TrySwiftData_Tests
//
//  Created by Natasha Murashev on 2/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

public let tko2018Locations: [String : Location] = [
    "qaroom" : {
        let location = Location()
        location.name = "Q&A Area"
        location.nameJP = "Q&Aルーム"
        return location
    }(),
    "mainroom" : {
        let location = Location()
        location.name = "Main Hall"
        location.nameJP = "ホール"
        return location
    }()
]
