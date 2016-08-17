//
//  AppDelegate.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/9/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        configureStyling()
        configureData()
        
        NSTimeZone.setDefaultTimeZone(NSTimeZone(abbreviation: "JST")!)
        return true
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
        if UIApplication.isFirstLaunch() {
            insertDefaultData()
        }
        
        if !NSUserDefaults.standardUserDefaults().boolForKey(Presentation.presentationUpdatedNotification) {
            Presentation.updateAllPresentations()
        }
        
        if !NSUserDefaults.standardUserDefaults().boolForKey(Speaker.speakersUpdatedNotification) {
            Speaker.updateAllSpeakers()
        }
    }
    
    func insertDefaultData() {
        Speaker.insertDefaultSpeakers()
        Presentation.insertDefaultPresentations()
    }
}

extension UIApplication {
    
    class func isFirstLaunch() -> Bool {
        if !NSUserDefaults.standardUserDefaults().boolForKey("HasAtLeastLaunchedOnce") {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "HasAtLeastLaunchedOnce")
            NSUserDefaults.standardUserDefaults().synchronize()
            return true
        }
        return false
    }
}