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
        
        configureStyling()
        configureData()
        
        NSTimeZone.default = TimeZone(abbreviation: "EST")!
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
        ChangeManager.syncChanges()
        ChangeManager.syncWatchChanges()
        completionHandler(.noData)
    }
}

private extension AppDelegate {
    
    func configureStyling() {
        
        let tintColor = UIColor.trySwiftMainColor()
        
        window?.tintColor = tintColor
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ]
        
        UINavigationBar.appearance().barTintColor = tintColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barStyle = .blackTranslucent
    }
    
    func configureData() {
        let defaults = UserDefaults.standard
        
        let appSubmitionDate = Date(year: 2016, month: 8, day: 16, hour: 5, minute: 0, second: 0)
        if defaults.object(forKey: ChangeManager.lastChangedDataNotification) == nil {
            defaults.set(appSubmitionDate, forKey: ChangeManager.lastChangedDataNotification)
        }
        if defaults.object(forKey: WatchSessionManager.watchDataUpdatedNotification) == nil {
            defaults.set(appSubmitionDate, forKey: WatchSessionManager.watchDataUpdatedNotification)
        }
        
        ChangeManager.syncChanges()
        ChangeManager.syncWatchChanges()
    }
}
