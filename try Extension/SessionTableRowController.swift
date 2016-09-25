//
//  SessionTableRowController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/23/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchKit
import TrySwiftDataWatch

class SessionTableRowController: NSObject {

    @IBOutlet fileprivate var titleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet fileprivate var subtitleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet var timeInterfaceLabel: WKInterfaceLabel!
    
    func configure(_ session: Session) {

        let info = session.info
        titleInterfaceLabel.setText(info.title)
        subtitleInterfaceLabel.setText(info.subtitle)

        timeInterfaceLabel.setText(session.timeString)
    }
}
