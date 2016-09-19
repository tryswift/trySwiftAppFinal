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
    fileprivate override init() {
        super.init()
    }
    
    static let watchDataUpdatedNotification = "LastUpdatedWatchChangeCreationData"
    fileprivate let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    func startSession() {
        session?.delegate = self
        session?.activate()
    }
}

// WCSessionDelegate
extension WatchSessionManager {
    
    // MARK: User Info
    // use when your app needs all the data
    // FIFO queue
    // Sender
    func transferUserInfo(_ userInfo: [String : AnyObject]) -> WCSessionUserInfoTransfer? {
        return validSession?.transferUserInfo(userInfo)
    }
    
    func session(_ session: WCSession,
                 didFinish userInfoTransfer: WCSessionUserInfoTransfer, error: Error?) {
        if let creationDate = userInfoTransfer.userInfo["creationDate"] {
            UserDefaults.standard.set(creationDate, forKey: WatchSessionManager.watchDataUpdatedNotification)
        }
    }
    
    // MARK: File Transfer
    func transferFile(_ file: URL, metadata: [String : AnyObject]) -> WCSessionFileTransfer? {
        return validSession?.transferFile(file, metadata: metadata)
    }
    
    func session(_ session: WCSession, didFinish fileTransfer: WCSessionFileTransfer, error: Error?) {
        if let creationDate = fileTransfer.file.metadata?["creationDate"] as? Date {
            UserDefaults.standard.set(creationDate, forKey: WatchSessionManager.watchDataUpdatedNotification)
        }
    }
}

extension WatchSessionManager {
    
    fileprivate var validSession: WCSession? {
        
        // paired - the user has to have their device paired to the watch
        // watchAppInstalled - the user must have your watch app installed
        
        if let session = session , session.isPaired && session.isWatchAppInstalled {
            return session
        }
        return nil
    }
}
