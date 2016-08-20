//
//  AppDelegate.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/9/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import CloudKit
import Timepiece

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        insertDefaultData()
        
        let notificationSettings = UIUserNotificationSettings(forTypes: .None, categories: nil)
        application.registerUserNotificationSettings(notificationSettings)
        application.registerForRemoteNotifications()
        
        subscribeToCloudChangeNotifications()
        
        WatchSessionManager.sharedManager.startSession()
        
        configureStyling()
        configureData()
        
        NSTimeZone.setDefaultTimeZone(NSTimeZone(abbreviation: "EST")!)
        
        return true
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void)
    {
        ChangeManager.syncChanges()
        ChangeManager.syncWatchChanges()
        completionHandler(.NoData)
    }
}

private extension AppDelegate {
    
    func configureStyling() {
        
        let tintColor = UIColor.trySwiftMainColor()
        
        window?.tintColor = tintColor
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont.systemFontOfSize(18)
        ]
        
        UINavigationBar.appearance().barTintColor = tintColor
        UINavigationBar.appearance().tintColor = .whiteColor()
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barStyle = .BlackTranslucent
    }
    
    func configureData() {
        
        let appSubmitionDate = NSDate.date(year: 2016, month: 8, day: 16, hour: 5, minute: 0, second: 0)
        if NSUserDefaults.standardUserDefaults().objectForKey(ChangeManager.lastChangedDataNotification) == nil {
            NSUserDefaults.standardUserDefaults().setObject(appSubmitionDate, forKey: ChangeManager.lastChangedDataNotification)
        }
        if NSUserDefaults.standardUserDefaults().objectForKey(WatchSessionManager.watchDataUpdatedNotification) == nil {
            NSUserDefaults.standardUserDefaults().setObject(appSubmitionDate, forKey: WatchSessionManager.watchDataUpdatedNotification)
        }
        
        ChangeManager.syncChanges()
        ChangeManager.syncWatchChanges()
    }
    
    func insertDefaultData() {
        Speaker.insertDefaultSpeakers()
        Presentation.insertDefaultPresentations()
    }
    
    func subscribeToCloudChangeNotifications() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            if !NSUserDefaults.standardUserDefaults().boolForKey("SubscribedToCloudChanges") {
                let predicate = NSPredicate(value: true)
                
                let subscription = CKSubscription(recordType: "Change", predicate: predicate, options: .FiresOnRecordCreation)
                
                let notificationInfo = CKNotificationInfo()
                notificationInfo.shouldSendContentAvailable = true
                
                subscription.notificationInfo = notificationInfo
                
                let publicDB = CKContainer.defaultContainer().publicCloudDatabase
                publicDB.saveSubscription(subscription) { subscription, error in
                    if subscription != nil {
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "SubscribedToCloudChanges")
                    }
                }
            }
        }
    }
}