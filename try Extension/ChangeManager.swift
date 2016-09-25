//
//  ChangeManager.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/20/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchConnectivity
import TrySwiftDataWatch
import RealmSwift

struct ChangeManager {
    
    static func updateRecordsFromChanges(changes: [[String: AnyObject]]) {
        
        changes.forEach {
            guard let object = $0["object"] as? String,
                let id = $0["id"] as? Int,
                let field = $0["field"] as? String,
                let newValue = $0["newValue"] as? String else {
                    return
            }
            
            let realm = try! Realm()
            if object == "Speaker" {
                if let speaker = realm.objects(Speaker.self).filter("id == \(id)").first {
                    try! realm.write {
                        speaker[field] = newValue
                    }
                }
            } else if object == "Presentation" {
                if let presentation = realm.objects(Presentation.self).filter("id == \(id)").first {
                    try! realm.write {
                        presentation[field] = newValue
                    }
                }
            }
        }
    }
    
    static func updateRecordFromFile(file: WCSessionFile) {
        guard let metadata = file.metadata else {
            return
        }
        
        guard let object = metadata["object"] as? String,
            let id = metadata["id"] as? Int,
            let field = metadata["field"] as? String else {
                return
        }
        
        let realm = try! Realm()
        if object == "Speaker" {
            if let speaker = realm.objects(Speaker.self).filter("id == \(id)").first {
                try! realm.write {
                    speaker["imageName"] = nil
                    speaker[field] = file.fileURL.path
                }
            }
        }
        
    }
}
