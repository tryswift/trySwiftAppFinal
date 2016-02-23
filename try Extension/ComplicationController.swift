//
//  ComplicationController.swift
//  try Extension
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
}

// MARK: - Timeline Configuration
extension ComplicationController {
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let startDate = timelineEntryDateForSession(Session.sessions.first!)
        handler(startDate)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let endDate = Session.sessions.last?.endTime
        handler(endDate)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
}

// MARK: - Timeline Population
extension ComplicationController {
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        getTimelineEntriesForComplication(complication, beforeDate: NSDate(), limit: 1) { entries in
            handler(entries?.first)
        }
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        var entries = [CLKComplicationTimelineEntry]()
        
        var session = Session.sessions.last
        while let thisSession = session {
            let thisEntryDate = timelineEntryDateForSession(thisSession)
            if date.compare(thisEntryDate) == .OrderedDescending {
                let tmpl = templateForSession(thisSession)
                let entry = CLKComplicationTimelineEntry(date: thisEntryDate, complicationTemplate: tmpl)
                entries.append(entry)
                if entries.count == limit { break }
            }
            if thisSession.index > 0 {
                session = Session.sessions[thisSession.index - 1]
            } else {
                session = nil
            }
            
        }
        
        handler(entries)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        var entries = [CLKComplicationTimelineEntry]()
        
        var session = Session.sessions.first
        while let thisSession = session {
            let thisEntryDate = timelineEntryDateForSession(thisSession)
            if date.compare(thisEntryDate) == .OrderedAscending {
                let tmpl = templateForSession(thisSession)
                let entry = CLKComplicationTimelineEntry(date: thisEntryDate, complicationTemplate: tmpl)
                entries.append(entry)
                if entries.count == limit { break }
            }
            session = Session.sessions[thisSession.index + 1]
        }
        
        handler(entries)
    }
}

// MARK: - Update Scheduling
extension ComplicationController {
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(nil)
    }
}

// MARK: - Placeholder Templates
extension ComplicationController {
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        let tmpl = CLKComplicationTemplateModularLargeStandardBody()
        
        let firstSession = Session.sessions.first!
        let lastSession = Session.sessions.last!
        
        tmpl.headerTextProvider = CLKSimpleTextProvider(text: "try! Conference")
        tmpl.body1TextProvider = CLKSimpleTextProvider(text: "")
        tmpl.body2TextProvider = CLKTimeIntervalTextProvider(startDate: firstSession.startTime, endDate: lastSession.endTime)
        
        handler(tmpl)
    }
}

// MARK: Private Helper Methods
private extension ComplicationController {
    
    func templateForSession(session: Session) -> CLKComplicationTemplate {
        let tmpl = CLKComplicationTemplateModularLargeStandardBody()
        
        if let image = UIImage(named: session.sessionType.rawValue) {
            tmpl.headerImageProvider = CLKImageProvider(onePieceImage: image)
        }
        
        tmpl.headerTextProvider = CLKTimeIntervalTextProvider(startDate: session.startTime, endDate: session.endTime)
        
        if let speaker = session.speaker {
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: speaker.presentation.title)
        } else {
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: session.description)
        }
        
        return tmpl
    }
    
    func timelineEntryDateForSession(session: Session) -> NSDate {
        if session.index - 1 > 0 {
            let previousSession = Session.sessions[session.index - 1]
            return previousSession.endTime
        } else {
            return NSDate()
        }
    }
}
