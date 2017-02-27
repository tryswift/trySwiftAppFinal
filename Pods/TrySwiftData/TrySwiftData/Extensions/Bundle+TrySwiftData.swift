//
//  Bundle+TrySwiftData.swift
//  Pods
//
//  Created by Tim Oliver on 2/14/17.
//
//

import Foundation

var sharedGroupName: String?

extension Bundle {

    public class func setTrySwiftSharedGroupIdentifier(_ name: String) {
        sharedGroupName = name
    }

    public class func trySwiftDataBundle() -> Bundle {
        // Return the shared groups bundle
//        let sharedBundleURL = Bundle.trySwiftSharedBundleURL()
//        if sharedBundleURL != nil && FileManager.default.fileExists(atPath: sharedBundleURL!.path) {
//            if let bundle = Bundle(url: sharedBundleURL!) {
//                return bundle
//            }
//        }

        // Return the Resource Bundle
        let bundleURL = Bundle.trySwiftResourceBundleURL()
        return Bundle(url: bundleURL)!
    }

    public class func copyTrySwiftBundleToSharedGroup() -> Bool {
        let sharedBundleURL = Bundle.trySwiftSharedBundleURL()
        let resourceBundleURL = Bundle.trySwiftResourceBundleURL()

        guard sharedBundleURL != nil else {
            return false
        }

        guard !FileManager.default.fileExists(atPath: sharedBundleURL!.path) else {
            return true
        }

        do {
            try FileManager.default.copyItem(at: resourceBundleURL, to: sharedBundleURL!)
        }
        catch { return false }

        return true
    }

    public class func trySwiftResourceBundleURL() -> URL {
        let classBundle = Bundle(for: Conference.self)
        if let bundleURL = classBundle.url(forResource: "TrySwiftData", withExtension: "bundle") {
            return bundleURL
        }
        return Bundle.main.bundleURL
    }

    public class func trySwiftSharedBundleURL() -> URL? {
        guard sharedGroupName != nil else {
            return nil
        }

        guard let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: sharedGroupName!) else {
            return nil
        }

        let bundleURL = containerURL.appendingPathComponent("TrySwiftData.bundle")
        return bundleURL
    }

    public class func trySwiftAssetURL(for name: String) -> URL? {
        let bundle = Bundle.trySwiftDataBundle()
        return bundle.url(forResource: name, withExtension: nil)
    }
}
