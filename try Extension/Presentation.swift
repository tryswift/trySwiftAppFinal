//
//  Presentation.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import RealmSwift

class Presentation: Object {
    dynamic var id: Int = 0
    dynamic var title: String = "TBD"
    dynamic var speaker: Speaker?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["id"]
    }
    
    class var presentations: Results<Presentation> {
        let realm = try! Realm()
        return realm.objects(Presentation.self)
    }
}

extension Presentation {
    
    class func insertDefaultPresentations() {
        if Presentation.presentations.count == 0 {
            let realm = try! Realm()
            try! realm.write {
                defaultPresentations.forEach {
                    realm.add($0)
                }
            }
        }
    }
}

let defaultPresentations: [Presentation] = [
    {
        let presentation = Presentation()
        presentation.id = 1
        presentation.title = "Pushing the Envelope with iOS 10 Notifications"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 1").first
        presentation.speaker = speaker ?? defaultSpeakers[0]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 2
        presentation.title = "Say It Ain't So: Implementing Speech Recognition in your app"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 2").first
        presentation.speaker = speaker ?? defaultSpeakers[1]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 3
        presentation.title = "Lambda: There and Back Again"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 3").first
        presentation.speaker = speaker ?? defaultSpeakers[2]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 4
        presentation.title = "Real World Swift Performance"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 4").first
        presentation.speaker = speaker ?? defaultSpeakers[3]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 5
        presentation.title = "Random Talk: The Consistent World of Noise"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 5").first
        presentation.speaker = speaker ?? defaultSpeakers[4]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 6
        presentation.title = "Swift eye for the Stringly typed API"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 6").first
        presentation.speaker = speaker ?? defaultSpeakers[5]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 7
        presentation.title = "Driving User Engagement with watchOS 3"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 7").first
        presentation.speaker = speaker ?? defaultSpeakers[6]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 8
        presentation.title = "Architectural Superpowers"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 8").first
        presentation.speaker = speaker ?? defaultSpeakers[7]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 9
        presentation.title = "Building user-centric security model in iOS applications"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 9").first
        presentation.speaker = speaker ?? defaultSpeakers[8]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 10
        presentation.title = "Decoding JSON with Swift"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 10").first
        presentation.speaker = speaker ?? defaultSpeakers[9]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 11
        presentation.title = "Incremental Swift"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 11").first
        presentation.speaker = speaker ?? defaultSpeakers[10]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 12
        presentation.title = "Building a Tiny Compiler"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 12").first
        presentation.speaker = speaker ?? defaultSpeakers[11]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 13
        presentation.title = "Property-Based Testing with SwiftCheck"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 14").first
        presentation.speaker = speaker ?? defaultSpeakers[13]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 14
        presentation.title = "Extending Xcode 8"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 15").first
        presentation.speaker = speaker ?? defaultSpeakers[14]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 15
        presentation.title = "Designs for the Human Mind"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 16").first
        presentation.speaker = speaker ?? defaultSpeakers[15]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 16
        presentation.title = "Result Oriented Development"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 17").first
        presentation.speaker = speaker ?? defaultSpeakers[16]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 17
        presentation.title = "I make iOS apps - is RxSwift for me?"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 18").first
        presentation.speaker = speaker ?? defaultSpeakers[17]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 18
        presentation.title = "Building a Better Language App with Swift"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 19").first
        presentation.speaker = speaker ?? defaultSpeakers[18]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 19
        presentation.title = "Healthy Minds in a Healthy Community"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 20").first
        presentation.speaker = speaker ?? defaultSpeakers[19]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 20
        presentation.title = "Refactoring at scale – Lessons learned rewriting Instagram’s feed"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 21").first
        presentation.speaker = speaker ?? defaultSpeakers[20]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 21
        presentation.title = "End-to-end application development in Swift"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 27").first
        presentation.speaker = speaker ?? defaultSpeakers[26]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 22
        presentation.title = "Making a Rich Text Editor in Swift"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 23").first
        presentation.speaker = speaker ?? defaultSpeakers[22]
        
        return presentation
    }(),
]


