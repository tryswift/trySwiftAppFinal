//
//  Presentation.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//


public class Presentation {
    public var id: Int = 0
    public var speaker: Speaker?
    public var title: String = "TBD"
    public var titleJP: String?
    public var summary: String = "TBD"
    public var summaryJP: String?

    public var localizedTitle: String {
        return localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedSummary: String {
        return localizedString(for: summary, japaneseString: summaryJP)
    }
}
