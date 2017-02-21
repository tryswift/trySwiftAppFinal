//
//  Configuration+TrySwift.swift
//  Pods
//
//  Created by Tim Oliver on 2/14/17.
//
//

import Foundation
import RealmSwift

extension Realm.Configuration {
    public static var trySwiftLocalConfiguration: Realm.Configuration {
        let localRealmURL = Bundle.trySwiftAssetURL(for: "tryswift.realm")

        var configuration = Realm.Configuration.defaultConfiguration
        configuration.readOnly = true
        configuration.fileURL = localRealmURL!
        return configuration
    }
}
