//
//  ExtensionDelegate.swift
//  try Extension
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchKit
import RealmSwift

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {
        configureData()
        NSTimeZone.setDefaultTimeZone(NSTimeZone(abbreviation: "EST")!)
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}

private extension ExtensionDelegate {
    
    func configureData() {
        insertDefaultData()
        let appSubmitionDate = NSDate.date(year: 2016, month: 8, day: 16, hour: 5, minute: 0, second: 0)
        NSUserDefaults.standardUserDefaults().setObject(appSubmitionDate, forKey: "LastChangeCreationData")
    }
    
    func insertDefaultData() {
        Speaker.insertDefaultSpeakers()
        Presentation.insertDefaultPresentations()
    }
}

