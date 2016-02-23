//
//  GlanceController.swift
//  try Extension
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import WatchKit
import Timepiece

class GlanceController: WKInterfaceController {

    @IBOutlet private var titleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet private var timeInterfaceLabel: WKInterfaceLabel!
    @IBOutlet private var speakerInterfaceImage: WKInterfaceImage!
    @IBOutlet private var nameInterfaceLabel: WKInterfaceLabel!
    @IBOutlet private var twitterInterfaceLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        configureDefault()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let sessions = Session.sessions
        
        let sessionForTime = sessions.filter { (($0.startTime - 5.minutes)...$0.endTime).contains(NSDate())}
        if let session = sessionForTime.first {
            configureSession(session)
        } else if NSDate() < (Session.sessions.first!.startTime - 1.day ) {
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
        titleInterfaceLabel.setText("try! Conference Tokyo, 🇯🇵")
        timeInterfaceLabel.setText(isJapanese ? "2016.3.2〜2016.3.4" : "Mar 2 - 4, 2016")
        speakerInterfaceImage.setImage(UIImage(named: "tryLogo"))
        nameInterfaceLabel.setText("try! 🤗")
        twitterInterfaceLabel.setText("@tryswiftconf")
    }
    
    func configureSession(session: Session) {
        if let speaker = session.speaker {
            titleInterfaceLabel.setText(speaker.presentation.title)
            speakerInterfaceImage.setImage(UIImage(named: speaker.image))
            nameInterfaceLabel.setText(speaker.name)
            twitterInterfaceLabel.setText("@\(speaker.twitter)")
        } else {
            titleInterfaceLabel.setText(session.description)
            speakerInterfaceImage.setImage(UIImage(named: "tryLogo"))
            nameInterfaceLabel.setText("try! 🤗")
            twitterInterfaceLabel.setText("@tryswiftconf")
        }
        
        timeInterfaceLabel.setText(session.timeString)
    }
}
