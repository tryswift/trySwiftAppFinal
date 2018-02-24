//
//  NYC2016Sessions.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let tko2018Sessions: [String : Session] = [
//---------------------------------------------------------
    // Day 1 Sessions
    "day1Breakfast" : {
        let session = Session()
        session.type = .breakfast
        session.title = "Registration & Breakfast"
        session.titleJP = "受付・朝食"
        session.imageAssetName = "donuts2.png"
        session.location = tko2018Locations["mainroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1Opening" : {
        let session = Session()
        session.type = .announcement
        session.title = "Opening Remarks"
        session.titleJP = "開会"
        session.imageAssetName = "announce2.png"
        session.location = tko2018Locations["mainroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1SwiftTour" : {
        let session = Session()
        session.type = .talk
        session.presentation = tko2018Presentations["swift_tour"]
        session.location = tko2018Locations["mainroom"]
        return session
    }(),
    "day1SwiftTourOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["swift_tour"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1SIL" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["sil"]
        return session
    }(),
//---------------------------------------------------------
    "day1Clang" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["clang"]
        return session
    }(),
    "day1ClangOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["clang"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
    //---------------------------------------------------------
    "day1FirstCoffee" : {
        let session = Session()
        session.type = .coffeeBreak
        session.imageAssetName = "breaktime1.png"
        session.location = tko2018Locations["mainroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1ResponderChain" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["responder_chain"]
        return session
    }(),
    "day1ResponderChainOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["responder_chain"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1Simplicity" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["simplicity"]
        return session
    }(),
    "day1SimplicityOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["simplicity"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1CodersDesign" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["coders-design"]
        return session
    }(),
    "day1CodersDesignOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["coders-design"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1Lunch" : {
        let session = Session()
        session.type = .lunch
        session.imageAssetName = "bento1.png"
        session.location = tko2018Locations["mainroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1Norman" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["icloud"]
        return session
    }(),
    "day1NormanOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["icloud"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1Diamond" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["diamond"]
        return session
    }(),
//---------------------------------------------------------
    "day1SwiftyPi" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["swiftypi"]
        return session
    }(),
    "day1SwiftyPiOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["swiftypi"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1SwiftHome" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["home"]
        return session
    }(),
//---------------------------------------------------------
    "day1UITesting" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["ui-testing"]
        return session
    }(),
    "day1UITestingOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["ui-testing"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1SecondCoffee" : {
        let session = Session()
        session.type = .coffeeBreak
        session.location = tko2018Locations["mainroom"]
        session.imageAssetName = "breaktime2.png"
        return session
    }(),
//---------------------------------------------------------
    "day1Blockchain" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["blockchain"]
        return session
    }(),
    "day2BlockchainOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["blockchain"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1WebAPI" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["webapi"]
        return session
    }(),
//---------------------------------------------------------
    "day1Game" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["game"]
        return session
    }(),
    "day1GameOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["game"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day1AST" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["ast"]
        return session
    }(),
//---------------------------------------------------------
    "day1Closing" : {
        let session = Session()
        session.type = .announcement
        session.title = "Closing / Announcments"
        session.titleJP = "クロージング"
        session.location = tko2018Locations["mainroom"]
        session.imageAssetName = "announce1.png"
        return session
    }(),


//---------------------------------------------------------
// Day 2 Sessions
    "day2Breakfast" : {
        let session = Session()
        session.type = .breakfast
        session.title = "Breakfast"
        session.titleJP = "受付・朝食"
        session.location = tko2018Locations["mainroom"]
        session.imageAssetName = "donuts1.png"
        return session
    }(),
    //---------------------------------------------------------
    "day2Opening" : {
        let session = Session()
        session.type = .announcement
        session.title = "Opening Remarks"
        session.titleJP = "開会"
        session.location = tko2018Locations["mainroom"]
        session.imageAssetName = "announce1.png"
        return session
    }(),
    //---------------------------------------------------------
    "day2Proofs" : {
        let session = Session()
        session.type = .talk
        session.presentation = tko2018Presentations["proofs"]
        session.location = tko2018Locations["mainroom"]
        return session
    }(),
    "day2ASTOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["ast"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
    //---------------------------------------------------------
    "day2PeerLabs" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["peerlabs"]
        return session
    }(),
    //---------------------------------------------------------
    "day2VisualizeAlgorithms" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["visualize-algorithms"]
        return session
    }(),
    "day2ProofsOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["proofs"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day2FirstCoffee" : {
        let session = Session()
        session.type = .coffeeBreak
        session.location = tko2018Locations["mainroom"]
        session.imageAssetName = "breaktime2.png"
        return session
    }(),
//---------------------------------------------------------
    "day2Kitura" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["kitura"]
        return session
    }(),
    "day2VisualizeAlgorithmsOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["visualize-algorithms"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day2CoreML" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["coreml"]
        return session
    }(),
//---------------------------------------------------------
    "day2Charles" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["charles"]
        return session
    }(),
    "day2KituraOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["kitura"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day2AR" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["ar"]
        return session
    }(),
    "day2CharlesOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["charles"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day2Lunch" : {
        let session = Session()
        session.type = .lunch
        session.location = tko2018Locations["mainroom"]
        session.imageAssetName = "bento2.png"
        return session
    }(),
//---------------------------------------------------------
    "day2Kotlin" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["kotlin"]
        return session
    }(),
    "day2AROfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["ar"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day2Swift5" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["swift5"]
        return session
    }(),
//---------------------------------------------------------
    "day2SignalProcessing" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["signal-processing"]
        return session
    }(),
    "day2KotlinOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["kotlin"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day2Codable" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["codable"]
        return session
    }(),
//---------------------------------------------------------
    "day2ConversationalInterfaces" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["conversational-interfaces"]
        return session
    }(),
    "day2SignalProcessingOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["signal-processing"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day2SecondCoffee" : {
        let session = Session()
        session.type = .coffeeBreak
        session.location = tko2018Locations["mainroom"]
        session.imageAssetName = "breaktime1.png"
        return session
    }(),
//---------------------------------------------------------
    "day2UIimageViewMetal" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["uiimageview-metal"]
        return session
    }(),
    "day2ConversationalInterfacesOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["conversational-interfaces"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
    //---------------------------------------------------------
    "day2Docker" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["docker"]
        return session
    }(),
    //---------------------------------------------------------
    "day2TypeErasure" : {
        let session = Session()
        session.type = .lightningTalk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["typeerasure"]
        return session
    }(),
    //---------------------------------------------------------
    "day2Tools" : {
        let session = Session()
        session.type = .talk
        session.location = tko2018Locations["mainroom"]
        session.presentation = tko2018Presentations["tools"]
        return session
    }(),
    "day2UIimageViewMetalOfficeHours" : {
        let session = Session()
        session.type = .officeHours
        session.presentation = tko2018Presentations["uiimageview-metal"]
        session.location = tko2018Locations["qaroom"]
        return session
    }(),
//---------------------------------------------------------
    "day2Closing" : {
        let session = Session()
        session.type = .announcement
        session.title = " Closing / Announcements"
        session.titleJP = "クロージング"
        session.location = tko2018Locations["mainroom"]
        session.imageAssetName = "announce2.png"
        return session
    }(),
//---------------------------------------------------------
    "day2Party" : {
        let session = Session()
        session.title = "Party"
        session.type = .party
        session.imageAssetName = "party2.png"
        session.venue = tko2018Venues["bellesalle-shinjuku"]
        session.location = tko2018Locations["mainroom"]
        return session
    }(),

//---------------------------------------------------------
// Day 3 Sessions

    "day3PeerLabs" : {
        let session = Session()
        session.type = .workshop
        session.title = "Peer Labs"
        session.imageAssetName = "workshop.jpg"
        session.titleJP = "受付・朝食"
        session.presentation = tko2018Presentations["peerlabs-tokyo"]
        session.venue = tko2018Venues["line"]
        return session
    }(),
    //---------------------------------------------------------
    "day3Workshop1" : {
        let session = Session()
        session.type = .workshop
        session.title = "Building real-world server-side Swift applications with Kitura"
        session.titleJP = "使える！Kituraを使ってサーバーサイドSwiftアプリを作ろう！"
        session.imageAssetName = "taiji.jpg"
        session.presentation = tko2018Presentations["kitura-workshop"]
        session.venue = tko2018Venues["casareal"]
        return session
    }(),
    //---------------------------------------------------------
    "day3Workshop2" : {
        let session = Session()
        session.type = .workshop
        session.title = "Cloud Firestore Workshop"
        session.titleJP = "Cloud Firestore Workshop"
        session.imageAssetName = "todd.jpg"
        session.presentation = tko2018Presentations["firebase-workshop"]
        session.venue = tko2018Venues["casareal"]
        return session
    }(),
    //---------------------------------------------------------
    "day3Workshop3" : {
        let session = Session()
        session.type = .workshop
        session.title = "Open Source Swift"
        session.titleJP = "Open Source Swift"
        session.imageAssetName = "opensource.png"
        session.presentation = tko2018Presentations["open-source-workshop"]
        session.venue = tko2018Venues["line"]
        return session
    }(),
    //---------------------------------------------------------
    "day3Workshop4" : {
        let session = Session()
        session.type = .workshop
        session.title = "Mastering Value Types in Swift with SWIFT QUEST"
        session.titleJP = "Swiftの値型を極める powered by SWIFT QUEST"
        session.imageAssetName = "koher.jpg"
        session.presentation = tko2018Presentations["swift-quest-workshop"]
        session.venue = tko2018Venues["casareal"]
        return session
    }(),
    //---------------------------------------------------------
    "day3Workshop5" : {
        let session = Session()
        session.type = .workshop
        session.title = "Augmented Reality, Swiftly!"
        session.titleJP = "AR をSwiftyに！"
        session.imageAssetName = "fb.jpg"
        session.presentation = tko2018Presentations["ar-workshop"]
        session.venue = tko2018Venues["dena"]
        return session
    }(),
    //---------------------------------------------------------
    "day3Workshop6" : {
        let session = Session()
        session.type = .workshop
        session.title = "Making Apps with Realm Cloud"
        session.titleJP = "Realm Cloudを使ってアプリを作ろう"
        session.imageAssetName = "katsumi.jpg"
        session.presentation = tko2018Presentations["realm-workshop"]
        session.venue = tko2018Venues["casareal"]
        return session
    }(),
    //---------------------------------------------------------

]
