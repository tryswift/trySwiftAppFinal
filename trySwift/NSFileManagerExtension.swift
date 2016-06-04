//
//  NSFileManagerExtension.swift
//  trySwift
//
//  Created by Bas Broek on 4/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Freddy

func dataJSON() throws -> JSON {
    let json = try JSON(data: jsonData())
    return try JSON(json.dictionary("data"))
}

func jsonVersion() throws -> Double {
    let json = try JSON(data: jsonData())
    return try json.double("version")
}

private func jsonData() throws -> NSData {
    guard let path = NSBundle.mainBundle().pathForResource("data", ofType: "json") else { throw DecodeError.InvalidPath }
    guard let data = NSFileManager.defaultManager().contentsAtPath(path) else { throw DecodeError.InvalidData }
    return data
}

enum DecodeError: ErrorType {
    case InvalidPath
    case InvalidData
}


import Alamofire

func networkJSONVersion() {
    
}

func networkJSONData(forVersion version: Float, completionHandler: (json: JSON) -> Void) {
    Alamofire.request(.GET, "https://tryswift.basbroek.nl/version/\(version)", parameters: [:], headers: [:]).responseJSON {
        if let data = $0.data {
            do {
                let json = try JSON(data: data)
                completionHandler(json: json)
            } catch {
                print(error)
            }
        } else {
            print("rip life")
        }
    }
}
