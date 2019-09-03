//
//  String+TrySwiftData.swift
//  Pods
//
//  Created by Tim Oliver on 2/19/17.
//
//

import Foundation

extension String {
    internal func localized() -> String {
        let bundle = Bundle.trySwiftDataBundle()
        return NSLocalizedString(self, tableName: "TrySwiftDataLocalizable", bundle: bundle, comment: "")
    }
}
