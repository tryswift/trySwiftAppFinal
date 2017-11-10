//
//  Event.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

public class Event: Object {
    @objc open dynamic var title: String = ""
    @objc open dynamic var titleJP: String?
    @objc open dynamic var logoAssetName: String?
    @objc open dynamic var logoImageWebURL: String?
    @objc open dynamic var location: String = ""
    @objc open dynamic var locationJP: String?
    @objc open dynamic var website: String?

    public var localizedTitle: String {
        return self.localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedLocation: String {
        return self.localizedString(for: location, japaneseString: locationJP)
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
