//
//  Presentation.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

public class Presentation: Object {
    @objc public dynamic var id: Int = 0
    @objc public dynamic var speaker: Speaker?
    @objc public dynamic var title: String = "TBD"
    @objc public dynamic var titleJP: String?
    @objc public dynamic var summary: String = "TBD"
    @objc public dynamic var summaryJP: String?

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
