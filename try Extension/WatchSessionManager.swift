//
//  WatchSessionManager.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/20/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit


import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate {
    
    static let sharedManager = WatchSessionManager()
    private override init() {
        super.init()
    }
    
    private let session = WCSession.defaultSession()
    
    func startSession() {
        session.delegate = self
        session.activateSession()
    }
}

extension WatchSessionManager {
    
    // MARK: User Info
    // use when your app needs all the data
    // FIFO queue
    // Receiver
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        if let changes = userInfo["changes"] as? [[String: AnyObject]] {
            ChangeManager.updateRecordsFromChanges(changes)
        }
    }
    
}

