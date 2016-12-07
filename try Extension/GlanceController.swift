//
//  GlanceController.swift
//  try Extension
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchKit
import Timepiece
import TrySwiftDataWatch

class GlanceController: WKInterfaceController {

    @IBOutlet fileprivate var titleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet fileprivate var timeInterfaceLabel: WKInterfaceLabel!
    @IBOutlet fileprivate var speakerInterfaceImage: WKInterfaceImage!
    @IBOutlet fileprivate var nameInterfaceLabel: WKInterfaceLabel!
    @IBOutlet fileprivate var twitterInterfaceLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        configureDefault()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let sessions = Session.sessions
        
        let sessionForTime = sessions.filter { (($0.startTime - 5.minutes)!...$0.endTime).contains(Date())}
        if let session = sessionForTime.first {
            configureSession(session)
        } else if Date() > (Session.sessions.first!.startTime - 1.day )! {
            configureSession(Session.sessions.first!)
        } else {
            configureDefault()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

private extension GlanceController {
    
    func configureDefault() {
        titleInterfaceLabel.setText("try! NYC 🗽🐥🎉")
        timeInterfaceLabel.setText("Sep 1 - 2, 2016")
        speakerInterfaceImage.setImage(UIImage(named: "tryLogo"))
        nameInterfaceLabel.setText("try! 🤗")
        twitterInterfaceLabel.setText("@tryswiftnyc")
    }
    
    func configureSession(_ session: Session) {
        let info = session.info
        titleInterfaceLabel.setText(info.title)
        speakerInterfaceImage.setImage(info.logo)
        nameInterfaceLabel.setText(info.subtitle)
        twitterInterfaceLabel.setText(info.twitter)
        
        timeInterfaceLabel.setText(session.timeString)
    }
}
