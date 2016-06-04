//
//  JSONManager.swift
//  trySwift
//
//  Created by Bas Broek on 4/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Freddy

private let defaults = NSUserDefaults.standardUserDefaults()

// This is an enum, which prevents it from being instantiated.
// See https://www.natashatherobot.com/swift-enum-no-cases/
enum JSONManager {
    
    static func dataJSON() throws -> JSON {
        let json = try JSON(data: jsonData())
        return try JSON(json.dictionary("data"))
    }
    
    private static func jsonData() throws -> NSData {
        let version = defaults.doubleForKey("version")
        
        switch version {
        case 0.0:
            // No version, set to 1.0.
            defaults.setDouble(1.0, forKey: "version")
            fallthrough
        case 1.0:
            // Get the JSON from the main bundle.
            guard let path = NSBundle.mainBundle().pathForResource("data-\(1.0)", ofType: "json") else { throw DecodeError.InvalidPath }
            guard let data = NSFileManager.defaultManager().contentsAtPath(path) else { throw DecodeError.InvalidData }
            return data
        default:
            // Get the JSON from the file it was saved in.
            guard let fileName = documentsDirectory?.stringByAppendingPathComponent("data-\(version).json") else { throw DecodeError.InvalidFileName }
            guard let data = NSData(contentsOfFile: fileName) else { throw DecodeError.NoData }
            return data
        }
    }
    
    static func save(JSON json: JSON, withVersion version: Double) {
        defaults.setDouble(version, forKey: "version")
        guard let fileName = documentsDirectory?.stringByAppendingPathComponent("data-\(version).json") else { return }
        do {
            try json.serialize().writeToFile(fileName, atomically: true)
        } catch {
            print(error)
        }
    }
    
    enum DecodeError: ErrorType {
        case InvalidPath
        case InvalidData
        case InvalidFileName
        case NoData
    }
    
    /// Returns the first path in the document directory.
    /// The return value is an NSString so it allows `stringByAppendingPathComponent(_:)`
    /// to be called on it.
    static var documentsDirectory: NSString? {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
    }
}
