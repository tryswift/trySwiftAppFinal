//
//  SessionsDay1InterfaceController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/23/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchKit
import Foundation
import RealmSwift

class SessionsInterfaceController: WKInterfaceController {

    @IBOutlet fileprivate var sessionsTable: WKInterfaceTable!
    
    fileprivate var sessions = Session.sessionsAug31
    
    var token: NotificationToken? = nil
    
    static var first = true
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if SessionsInterfaceController.first {
            WKInterfaceController.reloadRootControllers(withNames: ["Aug31", "Sep1", "Sep2"], contexts: [PageDetails.Aug31, PageDetails.Sep1, PageDetails.Sep2])
            SessionsInterfaceController.first = false
        }
        
        if let pageDetails = context as? PageDetails {
            sessions = pageDetails.sessions
            setTitle(pageDetails.title)
        }
        
        loadTableData()
        subscribeToChangeNotification()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    deinit {
        token?.stop()
    }
}

private extension SessionsInterfaceController {
    
    func loadTableData() {
        sessionsTable.setNumberOfRows(sessions.count, withRowType: String(describing: SessionTableRowController))
        
        for (index, session) in sessions.enumerated() {
            let row = sessionsTable.rowController(at: index) as? SessionTableRowController
            row?.configure(session)
        }
    }
    
    func subscribeToChangeNotification() {
        token = Presentation.presentations.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            self?.loadTableData()
        }
    }
}

// holder for sessions since it cannot be case to AnyObject
private class PageDetails: AnyObject {
    let title: String
    let sessions: [Session]
    
    init(title: String, sessions: [Session]) {
        self.title = title
        self.sessions = sessions
    }
    
    static let Aug31 = PageDetails(title: "try! Aug 31", sessions: Session.sessionsAug31)
    static let Sep1 = PageDetails(title: "try! Sep 1", sessions: Session.sessionsSept1)
    static let Sep2 = PageDetails(title: "try! Sep 2", sessions: Session.sessionsSept2)
}
