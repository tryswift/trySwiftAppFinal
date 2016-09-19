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
    fileprivate override init() {
        super.init()
    }
    
    fileprivate let session = WCSession.default()
    
    func startSession() {
        session.delegate = self
        session.activate()
    }
}

extension WatchSessionManager {
    
    // MARK: User Info
    // use when your app needs all the data
    // FIFO queue
    // Receiver
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any]) {
        if let changes = userInfo["changes"] as? [[String: AnyObject]] {
            ChangeManager.updateRecordsFromChanges(changes)
        }
    }
    
    // MARK: File Transfer
    func session(_ session: WCSession, didReceive file: WCSessionFile) {
        ChangeManager.updateRecordFromFile(file)
    }
    
}

