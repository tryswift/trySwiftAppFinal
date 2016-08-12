//
//  NetworkManager.swift
//  trySwift
//
//  Created by Bas Broek on 6/4/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

private let baseURL = "https://tryswift.basbroek.nl"
private let defaults = NSUserDefaults.standardUserDefaults()

// This is an enum, which prevents it from being instantiated.
// See https://www.natashatherobot.com/swift-enum-no-cases/
enum NetworkManager {
    
    static func jsonVersion(completionHandler: (version: String) -> Void) {
        Alamofire.request(.GET, "\(baseURL)/version").responseJSON {
            guard let data = $0.data else { return }
            do {
                let json = try JSON(data: data)
                let version = try json.string("data", "version")
                completionHandler(version: version)
            } catch {
                print(error)
            }
        }
    }
    
    static func jsonData(for version: String, completionHandler: (json: JSON) -> Void) {
        Alamofire.request(.GET, "\(baseURL)/version/\(version)").responseJSON {
            guard let data = $0.data else { return }
            do {
                let json = try JSON(data: data)
                completionHandler(json: json)
            } catch {
                print(error)
            }
        }
    }
    
    static func refreshJSONData(completionHandler: (updated: Bool, version: String) -> Void) {
        jsonVersion { version in
            guard version != defaults.stringForKey("version") else {
                completionHandler(updated: false, version: version)
                return
            }
            jsonData(for: version) { json in
                let result = JSONManager.save(JSON: json, with: version)
                completionHandler(updated: result, version: version)
            }
        }
    }
}
