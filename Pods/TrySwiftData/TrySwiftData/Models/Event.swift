//
//  Event.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

public struct Event {
    public let title: String
    public let titleJP: String?
    public let logoAssetName: String?
    public let location: String
    public let locationJP: String?
    public let website: String?

    public var localizedTitle: String {
        return localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedLocation: String {
        return localizedString(for: location, japaneseString: locationJP)
    }

    public var logoURL: URL {
        if let assetName = logoAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }
}
