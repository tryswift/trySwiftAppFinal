//
//  SessionsInterfaceController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/21/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import WatchKit
import Foundation
import TrySwiftData


class SessionsInterfaceController: WKInterfaceController {

    @IBOutlet var sessionsTable: WKInterfaceTable!
    
    fileprivate var conferenceDay = ConferenceDay.all[1]
    fileprivate static var first = true

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        if SessionsInterfaceController.first {
            let days = [ConferenceDay.all[0], ConferenceDay.all[1]]
            WKInterfaceController.reloadRootControllers(withNames: ["day1", "day2"], contexts: [days[0], days[1]])
            SessionsInterfaceController.first = false
        }
    
        
        if let sessionsContext = context as? ConferenceDay {
            conferenceDay = sessionsContext
        }
        
         loadTableData()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let sessionBlock = conferenceDay.sessionBlocks[rowIndex]
        presentController(withName: String(describing: SessionDetailInterfaceController.self), context: sessionBlock)
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

fileprivate extension SessionsInterfaceController {
    
    func loadTableData() {
        let sessionBlocks = conferenceDay.sessionBlocks
        sessionsTable.setNumberOfRows(sessionBlocks.count, withRowType: String(describing: SessionTableRowController.self))

        for (index, sessionBlock) in sessionBlocks.enumerated() {
            if let row = sessionsTable.rowController(at: index) as? SessionTableRowController {
                row.configure(sessionBlock)
            }
        }
    }
}

extension SessionType {
    var isOfficeHours: Bool {
        switch self {
        case .officeHours: return true
        default: return false
        }
    }
}
