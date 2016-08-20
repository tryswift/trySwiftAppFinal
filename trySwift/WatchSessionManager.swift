//
//  WatchSessionManager.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/20/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate {
    
    static let sharedManager = WatchSessionManager()
    private override init() {
        super.init()
    }
    
    static let watchDataUpdatedNotification = "LastUpdatedWatchChangeCreationData"
    private let session: WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    func startSession() {
        session?.delegate = self
        session?.activateSession()
    }
}

// WCSessionDelegate
extension WatchSessionManager {
    
    // MARK: User Info
    // use when your app needs all the data
    // FIFO queue
    // Sender
    func transferUserInfo(userInfo: [String : AnyObject]) -> WCSessionUserInfoTransfer? {
        return validSession?.transferUserInfo(userInfo)
    }
    
    func session(session: WCSession,
                 didFinishUserInfoTransfer userInfoTransfer: WCSessionUserInfoTransfer, error: NSError?) {
        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: WatchSessionManager.watchDataUpdatedNotification)
    }
}

extension WatchSessionManager {
    
    private var validSession: WCSession? {
        
        // paired - the user has to have their device paired to the watch
        // watchAppInstalled - the user must have your watch app installed
        
        if let session = session where session.paired && session.watchAppInstalled {
            return session
        }
        return nil
    }
}


