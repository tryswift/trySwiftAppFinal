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
    
    /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
    @available(watchOS 2.2, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }

    
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
            ChangeManager.updateRecordsFromChanges(changes: changes)
        }
    }
    
    // MARK: File Transfer
    @objc(session:didReceiveFile:) func session(_ session: WCSession, didReceive file: WCSessionFile) {
        ChangeManager.updateRecordFromFile(file: file)
    }
    
}

