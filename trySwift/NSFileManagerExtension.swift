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
    guard let path = NSBundle.mainBundle().pathForResource("data", ofType: "json") else { throw DecodeError.InvalidPath }
    guard let data = NSFileManager.defaultManager().contentsAtPath(path) else { throw DecodeError.InvalidData }
    let json = try JSON(data: data)
    return try JSON(json.dictionary("data"))
}

func jsonVersion() throws -> Double {
    guard let path = NSBundle.mainBundle().pathForResource("data", ofType: "json") else { throw DecodeError.InvalidPath }
    guard let data = NSFileManager.defaultManager().contentsAtPath(path) else { throw DecodeError.InvalidData }
    let json = try JSON(data: data)
    return try json.double("version")
}

enum DecodeError: ErrorType {
    case InvalidPath
    case InvalidData
}