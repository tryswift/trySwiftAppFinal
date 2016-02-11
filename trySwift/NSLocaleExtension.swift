//
//  NSLocaleExtension.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation

let isJapanese: Bool = {
    if let languageCode = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode) as? String {
        return languageCode == "ja"
    }
    return false
}()
