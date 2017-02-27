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
        // Return the Resource Bundle
        let bundleURL = Bundle.trySwiftResourceBundleURL()
        return Bundle(url: bundleURL)!
    }

    public class func trySwiftResourceBundleURL() -> URL {
        let classBundle = Bundle(for: Conference.self)
        if let bundleURL = classBundle.url(forResource: "TrySwiftData", withExtension: "bundle") {
            return bundleURL
        }
        return Bundle.main.bundleURL
    }

    public class func trySwiftAssetURL(for name: String) -> URL? {
        let bundle = Bundle.trySwiftDataBundle()
        return bundle.url(forResource: name, withExtension: nil)
    }
}
