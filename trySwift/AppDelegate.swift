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

        // Copy the TrySwift Data bundle from the app sandbox to the shared container
        // where the Today widget can access it
        Bundle.setTrySwiftSharedGroupIdentifier("group.com.tryTokyoTodaysExtension")
        Bundle.copyTrySwiftBundleToSharedGroup()

        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
        completionHandler(.noData)
    }
}

private extension AppDelegate {

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
