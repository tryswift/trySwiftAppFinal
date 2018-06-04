//
//  Location.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

public struct Location {
    public let name: String
    public let nameJP: String?

    public var localizedName: String {
        return localizedString(for: name, japaneseString: nameJP)
    }
}
