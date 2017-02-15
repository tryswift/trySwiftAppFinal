//
//  Object+LocalizedProperty.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 2/7/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation
import RealmSwift

extension Object {
    public func localizedString(for englishString: String, japaneseString: String?) -> String {
        // Get the current language code of the device
        let languageCode = NSLocale.preferredLanguages.first

        // Ensure a valid code was provided
        guard let code = languageCode else {
            return englishString
        }

        if code == "jp" || code == "ja" {
            guard let japaneseString = japaneseString else {
                return englishString
            }
            
            return japaneseString
        }

        return englishString
    }
}
