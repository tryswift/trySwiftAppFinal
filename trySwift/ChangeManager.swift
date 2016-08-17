//
//  ChangeManager.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/17/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift
import CloudKit

struct ChangeManager {
    
    static func syncChanges() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let publicDB = CKContainer.defaultContainer().publicCloudDatabase
            guard let lastChangeDate = NSUserDefaults.standardUserDefaults().objectForKey("LastChangeCreationData") as? NSDate else {
                let appSubmitionDate = NSDate.date(year: 2016, month: 8, day: 16, hour: 5, minute: 0, second: 0)
                NSUserDefaults.standardUserDefaults().setObject(appSubmitionDate, forKey: "LastChangeCreationData")
                return
            }
            
            let predicate = NSPredicate(format: "creationDate > %@", lastChangeDate)
            let query = CKQuery(recordType: "Change", predicate: predicate)
            publicDB.performQuery(query, inZoneWithID: nil) { result, error in
                
                guard let result = result else {
                    // will update again on future launch
                    return
                }
                
                result.forEach {
                    updateRecord($0)
                }
                NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: "LastChangeCreationData")
            }
        }
    }
}

private extension ChangeManager {
    
    static func updateRecord(record: CKRecord) {
        guard let object = record["object"] as? String,
            let id = record["id"] as? Int,
            let field = record["field"] as? String,
            let newValue = record["newValue"] as? String else {
                return
        }
        
        let realm = try! Realm()
        if object == "Speaker" {
            if let speaker = realm.objects(Speaker).filter("id == \(id)").first {
                try! realm.write {
                    speaker[field] = newValue
                }
            }
        } else if object == "Presentation" {
            if let presentation = realm.objects(Presentation).filter("id == \(id)").first {
                try! realm.write {
                    presentation[field] = newValue
                }
            }
        }
    }
}
