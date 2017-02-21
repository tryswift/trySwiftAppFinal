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
import RealmSwift

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
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
        completionHandler(.noData)
    }
}

private extension AppDelegate {
    
    func saveRealmDataToAppGroups() {
        
        let sharead = UserDefaults(suiteName: "group.com.tryTokyoTodayExtension")
        
        // Time 
        
        // Presentation Title
        
        // Speaker Image 
        
        // Speaker Name 
        
        // Speaker Twitter Handle 
        
        sharead?.synchronize()
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
