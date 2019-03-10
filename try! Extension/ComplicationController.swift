//
//  ComplicationController.swift
//  try! Extension
//
//  Created by Tim Oliver on 2/20/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import ClockKit
import TrySwiftData
import Foundation

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    fileprivate let conferenceStartDate = Date.date(year: 2019, month: 3, day: 21, hour: 0, minute: 0, second: 0)
    fileprivate let headerText = Conference.current.name
    fileprivate let bodyText = Conference.current.emojiSet 
    
    fileprivate let sessionBlocks: [SessionBlock] = {
        let days = ConferenceDay.all
        let conferenceDays = [days[0], days[1]]
        let sessionBlocks = conferenceDays.flatMap { $0.sessionBlocks }
        return sessionBlocks
    }()
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void)
    {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void)
    {
        let firstSessionBlock = sessionBlocks.first!
        handler(firstSessionBlock.startTime)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        let lastSessionBlock = sessionBlocks.last!
        handler(lastSessionBlock.endTime)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void)
    {
        let firstSession = sessionBlocks.first!
        let lastSession = sessionBlocks.last!

        let calendar = Calendar.current
        guard let currentDate = calendar.date(byAdding: .second, value:
            TimeZone.current.secondsFromGMT(), to: Date()) else {
            fatalError("Current date is invalid")
        }

        if currentDate < conferenceStartDate {
            let tmpl = CLKComplicationTemplateModularLargeStandardBody()
            tmpl.headerTextProvider = CLKSimpleTextProvider(text: headerText)
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: bodyText)
            let startDate = firstSession.startTime
            let style = CLKRelativeDateStyle.natural
            let units: NSCalendar.Unit = [.day, .hour, .minute]
            tmpl.body2TextProvider = CLKRelativeDateTextProvider(date: startDate as Date, style: style, units: units)
            
            let timelineEntry = CLKComplicationTimelineEntry(date: currentDate, complicationTemplate: tmpl)
            handler(timelineEntry)
        } else if currentDate > lastSession.endTime as Date {
            let tmpl = CLKComplicationTemplateModularLargeStandardBody()
            
            tmpl.headerTextProvider = CLKSimpleTextProvider(text: headerText)
            tmpl.body1TextProvider = CLKSimpleTextProvider(text: bodyText)
            tmpl.body2TextProvider = CLKTimeIntervalTextProvider(start: firstSession.startTime as Date, end: lastSession.endTime as Date)
            let timelineEntry = CLKComplicationTimelineEntry(date: currentDate, complicationTemplate: tmpl)
            handler(timelineEntry)
        } else {
            getTimelineEntries(for: complication, before: currentDate, limit: 1) { entries in
                handler(entries?.first)
            }
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        let timelineEntries = Array(sessionBlocks
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
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        
        let timelineEntries = sessionBlocks
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
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
}

private extension Date {
    func toUTC() -> Date {
        // Conference timelines are defined in EST
        let jst = TimeZone(abbreviation: Conference.current.timezone)!
        let calendar = Calendar.current
        guard let currentDate = calendar.date(byAdding: .second, value:
            -jst.secondsFromGMT(), to: self) else {
                fatalError("Current date is invalid")
        }
        return currentDate
    }
}

// MARK: Private Helper Methods
fileprivate extension ComplicationController {
    
    func templateForSession(_ sessionBlock: SessionBlock) -> CLKComplicationTemplate {
        let tmpl = CLKComplicationTemplateModularLargeStandardBody()
        
        tmpl.headerTextProvider = CLKTimeIntervalTextProvider(start: sessionBlock.startTime as Date, end: sessionBlock.endTime as Date, timeZone: TimeZone(abbreviation: "UTC")!)
        
        let session = sessionBlock.sessions.first!
        let viewModel = SessionViewModel(session: session)
        tmpl.body1TextProvider = CLKSimpleTextProvider(text: viewModel.title)
        
        return tmpl
    }
    
    func timelineEntryDateForSession(_ sessionBlock: SessionBlock) -> Date {

        if let index = sessionBlocks.index(where: {$0.startTime == sessionBlock.startTime}) {
            if index - 1 > 0 {
                let previousSessionBlock = sessionBlocks[index - 1]
                return previousSessionBlock.endTime.toUTC() as Date
            } else {
                return conferenceStartDate.toUTC()
            }
        }

        return conferenceStartDate.toUTC()
    }
}

