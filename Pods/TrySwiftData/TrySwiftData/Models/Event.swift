//
//  Event.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

public class Event: Object {
    open dynamic var title: String = ""
    open dynamic var titleJP: String?
    open dynamic var logo: String?
    open dynamic var location: String = ""
    open dynamic var locationJP: String?
    open dynamic var website: String?

    public var localizedTitle: String {
        return self.localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedLocation: String {
        return self.localizedString(for: location, japaneseString: locationJP)
    }
}
