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
