//
//  AppDelegate.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/9/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import CloudKit
import UserNotifications
import TrySwiftData
import Timepiece

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        BuddyBuildSDK.setup()
        
        let notificationSettings = UIUserNotificationSettings(types: UIUserNotificationType(), categories: nil)
        application.registerUserNotificationSettings(notificationSettings)
        application.registerForRemoteNotifications()

        WatchSessionManager.sharedManager.startSession()

        NSTimeZone.default = TimeZone(abbreviation: "UTC")!

        configureStyling()
        
        self.saveRealmDataToAppGroups()

        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
        completionHandler(.noData)
    }
}

private extension AppDelegate {
    
    func saveRealmDataToAppGroups() {
        
        let shared = UserDefaults(suiteName: "group.com.tryTokyoTodaysExtension")
        
        // Load data from Realm
        
        let conferenceDays = ConferenceDay.all
        let allSessions = [conferenceDays[0], conferenceDays[1]].flatMap { $0.sessionBlocks }
        
        var extensionData : [[String : AnyObject]] = []
        
        allSessions.forEach { value in
            
            var speakerDictionary : [String : String] = [:]
            
            if let session = value.sessions.first {
                
                speakerDictionary["title"] = session.formattedTitle
                speakerDictionary["subTitle"] = session.formattedSubtitle
                speakerDictionary["logoURL"] = session.logoURL.absoluteString
                speakerDictionary["sessionDescription"] = session.sessionDescription
                speakerDictionary["twitter"] = session.twitter
                speakerDictionary["presentationSummary"] = session.presentationSummary
                
            }
            
            extensionData.append([
                "startTime" : value.startTime as AnyObject,
                "endTime" : value.endTime as AnyObject,
                "sessions" :  speakerDictionary as AnyObject
                ])
        }
        
        shared?.set(extensionData, forKey: "extensionData")
        shared?.synchronize()
        
        
        let fileManager = FileManager.default
        if let directory = fileManager.containerURL(forSecurityApplicationGroupIdentifier: "group.com.tryTokyoTodaysExtension") {
            
//            let newDirectory = directory.URLByAppendingPathComponent("MyDirectory")
//            try! fileManager.createDirectoryAtURL(newDirectory, withIntermediateDirectories: false, attributes: nil)
            
            
            
        }
        
        
    }
    
    func configureStyling() {
                
        window?.tintColor = UIColor.trySwiftNavigationBarColor()
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ]
        
        UINavigationBar.appearance().backgroundColor = UIColor.trySwiftNavigationBarColor()
        UINavigationBar.appearance().barTintColor = UIColor.trySwiftNavigationBarColor()
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barStyle = .blackTranslucent
    }
}
