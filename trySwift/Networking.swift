//
//  Networking.swift
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
private let fileManager = NSFileManager.defaultManager()

// This is an enum, which prevents it from being instantiated.
// See https://www.natashatherobot.com/swift-enum-no-cases/
enum Networking {
    
    static func networkJSONVersion(completionHandler: (version: Double) -> Void) {
        Alamofire.request(.GET, "\(baseURL)/version").responseJSON {
            if let data = $0.data {
                do {
                    let json = try JSON(data: data)
                    let versionString = try json.string("data", "version")
                    guard let version = Double(versionString) else { return }
                    completionHandler(version: version)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    static func networkJSONData(forVersion version: Double, completionHandler: (json: JSON) -> Void) {
        Alamofire.request(.GET, "\(baseURL)/version/\(version)", parameters: [:], headers: [:]).responseJSON {
            if let data = $0.data {
                do {
                    let json = try JSON(data: data)
                    completionHandler(json: json)
                } catch {
                    print(error)
                }
            } else {
                print("No data")
            }
        }
    }
    
    static func refreshJSONData() {
        networkJSONVersion { version in
            guard version != defaults.doubleForKey("version") else { return }
            networkJSONData(forVersion: version) { json in
                fileManager.save(JSON: json, asVersion: version)
            }
        }
    }
}
