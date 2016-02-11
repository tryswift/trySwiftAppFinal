//
//  QASession.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Timepiece

struct QASession {
    let id: Int
    let startTime: NSDate
    let endTime: NSDate
    let speakers: [Speaker]
    let location: String
    
    var title: String {
        let speakerNames = speakers.map { $0.name }
        
        return "Q&A with \(speakerNames[0]), \(speakerNames[1]), & \(speakerNames[2])"
    }
}

extension QASession {
    
    static let SeminarRoom17F = isJapanese ? "17F セミナールーム" : "17F Seminar Room"
    
    static let qaSessionsDay1 = [
        QASession(
            id: 511,
            startTime: NSDate.date(year: 2016, month: 3, day: 2, hour: 11, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 2, hour: 12, minute: 55, second: 0),
            speakers: [Speaker.syoIkeda, Speaker.jpSimard, Speaker.yasuhiroInami],
            location: SeminarRoom17F
        ),
        QASession(
            id: 512,
            startTime: NSDate.date(year: 2016, month: 3, day: 2, hour: 14, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 2, hour: 15, minute: 55, second: 0),
            speakers: [Speaker.lauraSavino, Speaker.borisBugling, Speaker.gwendolynWeston],
            location: SeminarRoom17F
        ),
        QASession(
            id: 513,
            startTime: NSDate.date(year: 2016, month: 3, day: 2, hour: 16, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 2, hour: 17, minute: 55, second: 0),
            speakers: [Speaker.yutaKoshizawa, Speaker.micheleTitolo, Speaker.danielSteinberg],
            location: SeminarRoom17F
        )
    ]
    
    static let qaSessionsDay2 = [
        QASession(
            id: 521,
            startTime: NSDate.date(year: 2016, month: 3, day: 3, hour: 10, minute: 0, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 3, hour: 10, minute: 55, second: 0),
            speakers: [Speaker.timOliver, Speaker.stephanieShupe, Speaker.cateHuston],
            location: SeminarRoom17F
        ),
        QASession(
            id: 522,
            startTime: NSDate.date(year: 2016, month: 3, day: 3, hour: 11, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 3, hour: 12, minute: 55, second: 0),
            speakers: [Speaker.ayakaNonaka, Speaker.adamBell, Speaker.jesseSquires],
            location: SeminarRoom17F
        ),
        QASession(
            id: 523,
            startTime: NSDate.date(year: 2016, month: 3, day: 3, hour: 14, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 3, hour: 15, minute: 55, second: 0),
            speakers: [Speaker.matthewGillingham, Speaker.rachelBobbins, Speaker.himiSato],
            location: SeminarRoom17F
        ),
        QASession(
            id: 524,
            startTime: NSDate.date(year: 2016, month: 3, day: 3, hour: 16, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 3, hour: 17, minute: 55, second: 0),
            speakers: [Speaker.danielEggert, Speaker.novallKhan, Speaker.jeffHui],
            location: SeminarRoom17F
        )
    ]
    
    static let qaSessionsDay3 = [
        QASession(
            id: 531,
            startTime: NSDate.date(year: 2016, month: 3, day: 4, hour: 10, minute: 0, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 4, hour: 10, minute: 55, second: 0),
            speakers: [Speaker.yosukeIshikawa, Speaker.maximCramer, Speaker.chrisEidhof],
            location: SeminarRoom17F
        ),
        QASession(
            id: 532,
            startTime: NSDate.date(year: 2016, month: 3, day: 4, hour: 11, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 4, hour: 12, minute: 55, second: 0),
            speakers: [Speaker.hirokiKato, Speaker.natalieBerdys, Speaker.ashFurrow],
            location: SeminarRoom17F
        ),
        QASession(
            id: 533,
            startTime: NSDate.date(year: 2016, month: 3, day: 4, hour: 14, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 4, hour: 15, minute: 55, second: 0),
            speakers: [Speaker.veronicaRay, Speaker.hectorMatos, Speaker.simonGladman],
            location: SeminarRoom17F
        ),
        QASession(
            id: 534,
            startTime: NSDate.date(year: 2016, month: 3, day: 4, hour: 16, minute: 30, second: 0),
            endTime: NSDate.date(year: 2016, month: 3, day: 4, hour: 17, minute: 55, second: 0),
            speakers: [Speaker.dianaZmuda, Speaker.danielHaight, Speaker.helenHolmes],
            location: SeminarRoom17F
        )
    ]
}