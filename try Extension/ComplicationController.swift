//
//  ComplicationController.swift
//  try Extension
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import ClockKit
import Timepiece

class ComplicationController: NSObject, CLKComplicationDataSource {
    let conferenceStartDate = NSDate.date(year: 2016, month: 3, day: 2, hour: 0, minute: 0, second: 0)
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
        
        if NSDate() < conferenceStartDate {
            let tmpl = CLKComplicationTemplateModularLargeStandardBody()
            tmpl.headerTextProvider = CLKSimpleTextProvider(text: "try! Conference")
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: "Tokyo, 🇯🇵")
            let startDate = Session.sessions.first!.startTime
            let style = CLKRelativeDateStyle.Natural
            let units: NSCalendarUnit = [.Day, .Hour, .Minute]
            tmpl.body2TextProvider = CLKRelativeDateTextProvider(date: startDate, style: style, units: units)
            
            let timelineEntry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: tmpl)
            handler(timelineEntry)
        } else if NSDate() > Session.sessions.last!.endTime {
            let tmpl = CLKComplicationTemplateModularLargeStandardBody()
            
            let firstSession = Session.sessions.first!
            let lastSession = Session.sessions.last!
            
            tmpl.headerTextProvider = CLKSimpleTextProvider(text: "try! Conference")
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: "Tokyo, 🇯🇵")
            tmpl.body2TextProvider = CLKTimeIntervalTextProvider(startDate: firstSession.startTime, endDate: lastSession.endTime)
            let timelineEntry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: tmpl)
            handler(timelineEntry)
        } else {
            getTimelineEntriesForComplication(complication, beforeDate: NSDate(), limit: 1) { entries in
                handler(entries?.first)
            }
        }
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        
        let timelineEntries = Array(Session.sessions
            .filter { timelineEntryDateForSession($0) < date }
            .map {
                CLKComplicationTimelineEntry(date: timelineEntryDateForSession($0), complicationTemplate: templateForSession($0))
        }.reverse())
        
        
        if timelineEntries.count > limit {
            handler(Array(timelineEntries[0..<limit]))
        } else {
            handler(timelineEntries)
        }
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        
        let timelineEntries = Session.sessions
            .filter { timelineEntryDateForSession($0) > date }
            .map {
                CLKComplicationTimelineEntry(date: timelineEntryDateForSession($0), complicationTemplate: templateForSession($0))
        }
        
        if timelineEntries.count > limit {
            handler(Array(timelineEntries[0..<limit]))
        } else {
            handler(timelineEntries)
        }
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
        tmpl.body1TextProvider = CLKSimpleTextProvider(text: "Tokyo, 🇯🇵")
        tmpl.body2TextProvider = CLKTimeIntervalTextProvider(startDate: firstSession.startTime, endDate: lastSession.endTime)
        
        handler(tmpl)
    }
}

// MARK: Private Helper Methods
private extension ComplicationController {
    
    func templateForSession(session: Session) -> CLKComplicationTemplate {
        let tmpl = CLKComplicationTemplateModularLargeStandardBody()
        
        tmpl.headerTextProvider = CLKTimeIntervalTextProvider(startDate: session.startTime, endDate: session.endTime)
        
        if let speaker = session.speaker {
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: "🤓 \(speaker.presentation.title)")
        } else {
            if session.sessionType == .Announcement {
                tmpl.body1TextProvider = CLKSimpleTextProvider(text: "🎙 \(session.description)")
            } else {
                tmpl.body1TextProvider = CLKSimpleTextProvider(text: session.description)
            }
        }
        
        return tmpl
    }
    
    func timelineEntryDateForSession(session: Session) -> NSDate {
        if session.index - 1 > 0 {
            let previousSession = Session.sessions[session.index - 1]
            return previousSession.endTime
        } else {
            return conferenceStartDate
        }
    }
}
