//
//  SessionsDay1InterfaceController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/23/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchKit
import Foundation
import TrySwiftDataWatch

class SessionsInterfaceController: WKInterfaceController {

    @IBOutlet fileprivate var sessionsTable: WKInterfaceTable!
    
    fileprivate var sessions = Session.sessionsAug31Filtered
    
    fileprivate let changeNotificationManager = ChangeNotificationManager()
    
    static var first = true
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if SessionsInterfaceController.first {
            WKInterfaceController.reloadRootControllers(withNames: ["Aug31", "Sep1", "Sep2"], contexts: [Session.sessionsAug31Filtered, Session.sessionsSept1Filtered, Session.sessionsSept2Filtered])
            SessionsInterfaceController.first = false
        }

        if let sessionsContext = context as? [Session] {
            sessions = sessionsContext
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
}

private extension SessionsInterfaceController {
    
    func loadTableData() {
        sessionsTable.setNumberOfRows(sessions.count, withRowType: String(describing: SessionTableRowController.self))
        
        for (index, session) in sessions.enumerated() {
            let row = sessionsTable.rowController(at: index) as? SessionTableRowController
            row?.configure(session)
        }
    }
    
    func subscribeToChangeNotification() {
        changeNotificationManager.subscribeToPresenationChange { [weak self] in
            self?.loadTableData()
        }
    }
}
