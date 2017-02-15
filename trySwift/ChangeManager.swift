//
//  ChangeManager.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/17/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift
import CloudKit
import TrySwiftData
import Timepiece

struct ChangeManager {
    
    static let lastChangedDataNotification = "LastChangedDataNotification"
    
    static func syncChanges() {
        let defaults = UserDefaults.standard
        DispatchQueue.global().async {
            let publicDB = CKContainer.default().publicCloudDatabase
            guard let lastChangeDate = defaults.object(forKey: ChangeManager.lastChangedDataNotification) as? Date else {
                let appSubmitionDate = Date(year: 2016, month: 8, day: 16, hour: 5, minute: 0, second: 0)
                defaults.set(appSubmitionDate, forKey: ChangeManager.lastChangedDataNotification)
                return
            }
            
            let predicate = NSPredicate(format: "creationDate > %@", lastChangeDate as CVarArg)
            let query = CKQuery(recordType: "Change", predicate: predicate)
            publicDB.perform(query, inZoneWith: nil) { result, error in
                
                guard let result = result else {
                    // will update again on future launch
                    return
                }
                
                result.forEach {
                    updateRecord($0)
                }
                defaults.set(Date(), forKey: ChangeManager.lastChangedDataNotification)
            }
        }
    }
    
    static func syncWatchChanges() {
        let defaults = UserDefaults.standard
        DispatchQueue.global().async {
            let publicDB = CKContainer.default().publicCloudDatabase
            guard let lastChangeDate = defaults.object(forKey: WatchSessionManager.watchDataUpdatedNotification) as? Date else {
                let appSubmitionDate = Date(year: 2016, month: 8, day: 16, hour: 5, minute: 0, second: 0)
                defaults.set(appSubmitionDate, forKey: WatchSessionManager.watchDataUpdatedNotification)
                return
            }
            
            let predicate = NSPredicate(format: "creationDate > %@", lastChangeDate as CVarArg)
            let query = CKQuery(recordType: "Change", predicate: predicate)
            publicDB.perform(query, inZoneWith: nil) { result, error in
                
                guard let result = result else {
                    // will update again on future launch
                    return
                }
                
                guard !result.isEmpty else { return }
                
                var changes = [[String: AnyObject]]()
                
                result.forEach {
                    guard let creationDate = $0.creationDate,
                        let object = $0["object"] as? String,
                        let id = $0["id"] as? Int,
                        let field = $0["field"] as? String,
                        let newValue = $0["newValue"] as? String else {
                            return
                    }
                    
                    let changeDict: [String : AnyObject] = [
                        "creationDate" : creationDate as AnyObject,
                        "object": object as AnyObject,
                        "id": id as AnyObject,
                        "field": field as AnyObject,
                        "newValue": newValue as AnyObject]
                    
                    if field == "imagePath" {
                        guard let imageAsset = $0["image"] as? CKAsset else { return }
                        _ = WatchSessionManager.sharedManager.transferFile(imageAsset.fileURL, metadata: changeDict)
                    } else {
                        changes.append(changeDict)
                        _ = WatchSessionManager.sharedManager.transferUserInfo(["changes" : changes as AnyObject])
                    }
                }
            }
        }
    }
}

private extension ChangeManager {
    
    static func updateRecord(_ record: CKRecord) {
        guard let object = record["object"] as? String,
            let id = record["id"] as? Int,
            let field = record["field"] as? String,
            let newValue = record["newValue"] as? String else {
                return
        }
        
        
        let realm = try! Realm()
        if object == "Speaker" {
            if let speaker = realm.objects(Speaker.self).filter("id == \(id)").first {
                if field == "imagePath" {
                    guard let imageAsset = record["image"] as? CKAsset else {
                        return
                    }
                    
                    try! realm.write {
                        speaker["imageName"] = nil
                        speaker[field] = imageAsset.fileURL.path
                    }
                    
                } else {
                    try! realm.write {
                        speaker[field] = newValue
                    }
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
