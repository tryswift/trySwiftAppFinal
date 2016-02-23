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
        if let speaker = session.speaker {
            titleInterfaceLabel.setText("🤓 \(speaker.presentation.title)")
            subtitleInterfaceLabel.setText(speaker.name)
        } else {
            if session.sessionType == .Announcement {
                titleInterfaceLabel.setText("🎙 \(session.description)")
            } else {
                titleInterfaceLabel.setText(session.description)   
            }
            subtitleInterfaceLabel.setText("try!")
        }
        
        timeInterfaceLabel.setText(session.timeString)
    }
}
