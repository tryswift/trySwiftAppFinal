//
//  Presentation.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

public class Presentation: Object {
    public dynamic var id: Int = 0
    public dynamic var speaker: Speaker?
    public dynamic var title: String = "TBD"
    public dynamic var titleJP: String?
    public dynamic var summary: String = "TBD"
    public dynamic var summaryJP: String?

    public var localizedTitle: String {
        return self.localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedSummary: String {
        return self.localizedString(for: summary, japaneseString: summaryJP)
    }

    public override static func primaryKey() -> String? {
        return "id"
    }
}
