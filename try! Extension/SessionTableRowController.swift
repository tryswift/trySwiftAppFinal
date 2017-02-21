//
//  SessionTableRowController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/21/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import WatchKit
import TrySwiftData

class SessionTableRowController: NSObject {
    
    @IBOutlet var titleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet var subtitleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet var timeInterfaceLabel: WKInterfaceLabel!
    
    func configure(_ sessionBlock: SessionBlock) {
        
        let session = sessionBlock.sessions.first
        titleInterfaceLabel.setText(session?.formattedTitle)
        subtitleInterfaceLabel.setText(session?.formattedSubtitle)

        timeInterfaceLabel.setText(sessionBlock.timeString)
    }
}
