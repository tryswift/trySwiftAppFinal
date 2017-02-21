//
//  Bundle+TrySwiftData.swift
//  Pods
//
//  Created by Tim Oliver on 2/14/17.
//
//

import Foundation

extension Bundle {
    public class func trySwiftDataBundle() -> Bundle {
        let classBundle = Bundle(for: Conference.self)
        if let bundleURL = classBundle.url(forResource: "TrySwiftData", withExtension: "bundle") {
            if let podBundle = Bundle(url: bundleURL) {
                return podBundle
            }
        }

        return classBundle
    }

    public class func trySwiftAssetURL(for name: String) -> URL? {
        let bundle = Bundle.trySwiftDataBundle()
        return bundle.url(forResource: name, withExtension: nil)
    }
}
