//
//  SessionTableRowController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/23/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchKit

class SessionTableRowController: NSObject {

    @IBOutlet private var titleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet private var subtitleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet var timeInterfaceLabel: WKInterfaceLabel!
    
    func configure(session: Session) {

        let info = session.info
        titleInterfaceLabel.setText(info.title)
        subtitleInterfaceLabel.setText(info.subtitle)

        timeInterfaceLabel.setText(session.timeString)
    }
}
