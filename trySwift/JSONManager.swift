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
private let fileManager = NSFileManager.defaultManager()
private let bundle = NSBundle.mainBundle()

// This is an enum, which prevents it from being instantiated.
// See https://www.natashatherobot.com/swift-enum-no-cases/
enum JSONManager {
    
    static func dataJSON() throws -> JSON {
        let json = try JSON(data: jsonData())
        return try JSON(json.dictionary("data"))
    }
    
    private static func jsonData() throws -> NSData {
        let version = defaults.stringForKey("version") ?? "0.0"
        
        switch version {
        case "0.0":
            // No version, set to 1.0.
            defaults.setObject("1.0", forKey: "version")
            fallthrough
        case "1.0":
            // Get the JSON from the main bundle.
            guard let path = bundle.pathForResource("data-\(1.0)", ofType: "json") else { throw DecodeError.InvalidPath }
            guard let data = fileManager.contentsAtPath(path) else { throw DecodeError.InvalidData }
            return data
        default:
            // Get the JSON from the file it was saved in.
            guard let fileName = jsonFile(for: version) else { throw DecodeError.InvalidFileName }
            guard let data = NSData(contentsOfFile: fileName) else { throw DecodeError.NoData }
            return data
        }
    }
    
    static func save(JSON json: JSON, with version: String) -> Bool {
        guard let fileName = jsonFile(for: version) else { return false }
        do {
            let result = try json.serialize().writeToFile(fileName, atomically: true)
            let previousVersion = defaults.stringForKey("version") ?? "0.0"
            defaults.setObject(version, forKey: "version")
            if let previousVersionFile = jsonFile(for: previousVersion) {
                let _ = try? fileManager.removeItemAtPath(previousVersionFile)
            }
            return result
        } catch {
            print(error)
        }
        
        return false
    }
    
    enum DecodeError: ErrorType {
        case InvalidPath
        case InvalidData
        case InvalidFileName
        case NoData
    }
}

private extension JSONManager {

    /// Returns the first path in the document directory.
    /// The return value is an NSString so it allows `stringByAppendingPathComponent(_:)`
    /// to be called on it.
    private static var documentsDirectory: NSString? {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
    }
    
    private static func jsonFile(for version: String) -> String? {
        return documentsDirectory?.stringByAppendingPathComponent("data-\(version).json")
    }
}
