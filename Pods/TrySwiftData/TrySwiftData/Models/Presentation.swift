//
//  Presentation.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation

public struct Presentation {
    public let id: Int
    public let speaker: Speaker?
    public let title: String
    public let titleJP: String?
    public let summary: String
    public let summaryJP: String?

    public var localizedTitle: String {
        return localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedSummary: String {
        return localizedString(for: summary, japaneseString: summaryJP)
    }
}
