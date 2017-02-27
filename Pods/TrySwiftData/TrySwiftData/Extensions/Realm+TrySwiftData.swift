//
//  Realm+TrySwift.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 2/14/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import RealmSwift

enum RealmError: Error {
    case realmNotFound
}

extension Realm {
    public class func trySwiftRealm() throws -> Realm {
        let configuration = Configuration.trySwiftLocalConfiguration
        if configuration == nil {
            throw RealmError.realmNotFound
        }

        return try Realm(configuration: Configuration.trySwiftLocalConfiguration!)
    }
}
