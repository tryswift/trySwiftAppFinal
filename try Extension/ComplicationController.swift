//
//  ComplicationController.swift
//  try Extension
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import ClockKit
import TrySwiftDataWatch

class ComplicationController: NSObject, CLKComplicationDataSource {
    let conferenceStartDate = Date.date(year: 2016, month: 8, day: 31, hour: 0, minute: 0, second: 0)
}

// MARK: - Timeline Configuration
extension ComplicationController {
    
    @objc(getSupportedTimeTravelDirectionsForComplication:withHandler:) public func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Swift.Void) {
        handler([.forward, .backward])
    }
    
    @objc(getTimelineStartDateForComplication:withHandler:) func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        let startDate = timelineEntryDateForSession(Session.sessions.first!)
        handler(startDate)
    }
    
    @objc(getTimelineEndDateForComplication:withHandler:) func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        let endDate = Session.sessions.last?.endTime
        handler(endDate as Date?)
    }
    
    @objc(getPrivacyBehaviorForComplication:withHandler:) func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
}

// MARK: - Timeline Population
extension ComplicationController {
    
    @objc(getCurrentTimelineEntryForComplication:withHandler:) func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: (@escaping (CLKComplicationTimelineEntry?) -> Void)) {
        
        if Date() < conferenceStartDate {
            let tmpl = CLKComplicationTemplateModularLargeStandardBody()
            tmpl.headerTextProvider = CLKSimpleTextProvider(text: "try! NYC")
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: "🗽🐥🎉")
            let startDate = Session.sessions.first!.startTime
            let style = CLKRelativeDateStyle.natural
            let units: NSCalendar.Unit = [.day, .hour, .minute]
            tmpl.body2TextProvider = CLKRelativeDateTextProvider(date: startDate as Date, style: style, units: units)
            
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: tmpl)
            handler(timelineEntry)
        } else if Date() > Session.sessions.last!.endTime as Date {
            let tmpl = CLKComplicationTemplateModularLargeStandardBody()
            
            let firstSession = Session.sessions.first!
            let lastSession = Session.sessions.last!
            
            tmpl.headerTextProvider = CLKSimpleTextProvider(text: "try! NYC")
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: "🗽🐥🎉")
            tmpl.body2TextProvider = CLKTimeIntervalTextProvider(start: firstSession.startTime as Date, end: lastSession.endTime as Date)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: tmpl)
            handler(timelineEntry)
        } else {
            getTimelineEntries(for: complication, before: Date(), limit: 1) { entries in
                handler(entries?.first)
            }
        }
    }
    
    @objc(getTimelineEntriesForComplication:beforeDate:limit:withHandler:) func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: (@escaping ([CLKComplicationTimelineEntry]?) -> Void)) {
        
        let timelineEntries = Array(Session.sessions
            .filter { timelineEntryDateForSession($0) < date }
            .map {
                CLKComplicationTimelineEntry(date: timelineEntryDateForSession($0), complicationTemplate: templateForSession($0))
        }.reversed())
        
        
        if timelineEntries.count > limit {
            handler(Array(timelineEntries[0..<limit]))
        } else {
            handler(timelineEntries)
        }
    }
    
    @objc(getTimelineEntriesForComplication:afterDate:limit:withHandler:) func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: (@escaping ([CLKComplicationTimelineEntry]?) -> Void)) {
        
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
    
    func getNextRequestedUpdateDate(handler: @escaping (Date?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(nil)
    }
}

// MARK: - Placeholder Templates
extension ComplicationController {
    
    @objc(getPlaceholderTemplateForComplication:withHandler:) func getPlaceholderTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        let tmpl = CLKComplicationTemplateModularLargeStandardBody()
        
        let firstSession = Session.sessions.first!
        let lastSession = Session.sessions.last!
        
        tmpl.headerTextProvider = CLKSimpleTextProvider(text: "try! NYC")
        tmpl.body1TextProvider = CLKSimpleTextProvider(text: "🗽🐥🎉")
        tmpl.body2TextProvider = CLKTimeIntervalTextProvider(start: firstSession.startTime as Date, end: lastSession.endTime as Date)
        
        handler(tmpl)
    }
}

// MARK: Private Helper Methods
private extension ComplicationController {
    
    func templateForSession(_ session: Session) -> CLKComplicationTemplate {
        let tmpl = CLKComplicationTemplateModularLargeStandardBody()
        
        tmpl.headerTextProvider = CLKTimeIntervalTextProvider(start: session.startTime as Date, end: session.endTime as Date)
        
        let info = session.info
        tmpl.body1TextProvider = CLKSimpleTextProvider(text: info.title)
        
        return tmpl
    }
    
    func timelineEntryDateForSession(_ session: Session) -> Date {
        if session.index! - 1 > 0 {
            let previousSession = Session.sessions[session.index! - 1]
            return previousSession.endTime as Date
        } else {
            return conferenceStartDate
        }
    }
}
