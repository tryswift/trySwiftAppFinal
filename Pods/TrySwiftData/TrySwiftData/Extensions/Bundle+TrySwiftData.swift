//
//  Bundle+TrySwiftData.swift
//  Pods
//
//  Created by Tim Oliver on 2/14/17.
//
//

import Foundation

extension Bundle {
    public class func trySwiftAsset(named name: String) -> URL? {
        let podBundle = Bundle(for: Conference.self)
        if let bundleURL = podBundle.url(forResource: "trySwiftData", withExtension: "bundle") {
            if let bundle = Bundle(url: bundleURL) {
                return bundle.url(forResource: name, withExtension: nil)
            }
        }

        return nil
    }
}
