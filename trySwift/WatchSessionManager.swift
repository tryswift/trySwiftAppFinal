//
//  WatchSessionManager.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/20/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate {
   
    /** Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession. */
    @available(iOS 9.3, *)
    public func sessionDidDeactivate(_ session: WCSession) {
        
    }

    
    /** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */
    @available(iOS 9.3, *)
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }

    /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
    @available(iOS 9.3, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }

    
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
    
    @objc(session:didFinishUserInfoTransfer:error:) func session(_ session: WCSession,
                 didFinish userInfoTransfer: WCSessionUserInfoTransfer, error: Error?) {
        if let creationDate = userInfoTransfer.userInfo["creationDate"] {
            UserDefaults.standard.set(creationDate, forKey: WatchSessionManager.watchDataUpdatedNotification)
        }
    }
    
    // MARK: File Transfer
    func transferFile(_ file: URL, metadata: [String : AnyObject]) -> WCSessionFileTransfer? {
        return validSession?.transferFile(file, metadata: metadata)
    }
    
    @objc(session:didFinishFileTransfer:error:) func session(_ session: WCSession, didFinish fileTransfer: WCSessionFileTransfer, error: Error?) {
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
