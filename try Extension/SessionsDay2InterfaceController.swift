//
//  SessionsDay2InterfaceController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/23/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchKit
import Foundation


class SessionsDay2InterfaceController: WKInterfaceController {

    @IBOutlet private var sessionsTable: WKInterfaceTable!
    
    private let sessions = Session.sessionsDay2
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        setTitle(isJapanese ? "3月3日（木）" : "try! Mar 3")
        loadTableData()
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

private extension SessionsDay2InterfaceController {
    
    func loadTableData() {
        sessionsTable.setNumberOfRows(sessions.count, withRowType: String(SessionTableRowController))
        
        for (index, session) in sessions.enumerate() {
            let row = sessionsTable.rowControllerAtIndex(index) as? SessionTableRowController
            row?.configure(session)
        }
    }
}
