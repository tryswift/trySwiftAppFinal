//
//  Realm+TrySwift.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 2/14/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
    public class func trySwiftRealm() throws -> Realm {
        return try Realm(configuration: Configuration.trySwiftLocalConfiguration)
    }
}
