//
//  StringExtension.swift
//  trySwift
//
//  Created by Tim Oliver on 2/19/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

extension String {
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
