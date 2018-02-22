//
//  Event.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

public class Event {
    public var title: String = ""
    public var titleJP: String?
    public var logoAssetName: String?
    public var logoImageWebURL: String?
    public var location: String = ""
    public var locationJP: String?
    public var website: String?

    public var localizedTitle: String {
        return localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedLocation: String {
        return localizedString(for: location, japaneseString: locationJP)
    }

    public var logoURL: URL {
        if let url = logoImageWebURL {
            return URL(string: url)!
        }

        if let assetName = logoAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }
}
