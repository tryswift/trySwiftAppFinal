//
//  NYC2016SessionBlocks.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2018 NatashaTheRobot. All rights reserved.
//

import Foundation

public let tko2018SessionBlocks: [SessionBlock] = [

    // Day 1
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 8, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 9, minute: 45, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Breakfast"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 9, minute: 45, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 10, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Opening"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 10, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 10, minute: 25, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1SwiftTour"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 10, minute: 25, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 10, minute: 35, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1SIL"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 10, minute: 35, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 11, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Clang"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1SwiftTourOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 11, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 11, minute: 40, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1FirstCoffee"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 11, minute: 40, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 12, minute: 5, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1ResponderChain"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1ClangOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 12, minute: 5, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 12, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Simplicity"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1ResponderChainOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 12, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 13, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1CodersDesign"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1SimplicityOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 13, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 14, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Lunch"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 14, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 14, minute: 55, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Norman"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1CodersDesignOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 14, minute: 55, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 15, minute: 05, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Diamond"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 15, minute: 05, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 15, minute: 25, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1SwiftyPi"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1NormanOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 15, minute: 25, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 15, minute: 35, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1SwiftHome"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 15, minute: 35, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 16, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1UITesting"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1SwiftyPiOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 16, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 16, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1SecondCoffee"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 16, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 16, minute: 50, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Blockchain"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1UITestingOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 16, minute: 50, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 17, minute: 05, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1WebAPI"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 17, minute: 05, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 17, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Game"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2BlockchainOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 17, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 18, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1AST"]!)
        sessionBlock.sessions.append(tko2018Sessions["day1GameOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 1, hour: 18, minute: 00, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 1, hour: 18, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day1Closing"]!)
        return sessionBlock
    }(),

    // Day 2
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 9, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 9, minute: 45, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Breakfast"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 9, minute: 45, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 10, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Opening"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 10, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 10, minute: 25, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Proofs"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2ASTOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 10, minute: 25, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 10, minute: 35, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2PeerLabs"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 10, minute: 35, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 11, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2VisualizeAlgorithms"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2ProofsOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 11, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 11, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2FirstCoffee"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 11, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 11, minute: 50, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Kitura"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2VisualizeAlgorithmsOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 11, minute: 50, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 12, minute: 05, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2CoreML"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 12, minute: 05, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 12, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Charles"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2KituraOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 12, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 13, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2AR"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2CharlesOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 13, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 14, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Lunch"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 14, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 14, minute: 50, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Kotlin"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2AROfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 14, minute: 50, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 15, minute: 05, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Swift5"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 15, minute: 05, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 15, minute: 25, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2SignalProcessing"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2KotlinOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 15, minute: 25, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 15, minute: 35, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Codable"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 15, minute: 35, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 16, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2ConversationalInterfaces"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2SignalProcessingOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 16, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 16, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2SecondCoffee"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 16, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 16, minute: 50, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2UIimageViewMetal"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2ConversationalInterfacesOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 16, minute: 50, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 17, minute: 05, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Docker"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 17, minute: 05, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 17, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2TypeErasure"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 17, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 18, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Tools"]!)
        sessionBlock.sessions.append(tko2018Sessions["day2UIimageViewMetalOfficeHours"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 18, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 18, minute: 30, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Closing"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 2, hour: 18, minute: 30, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 2, hour: 21, minute: 00, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day2Party"]!)
        return sessionBlock
    }(),

    // Day 3
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 3, hour: 9, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 3, hour: 13, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day3Workshop1"]!)
        sessionBlock.sessions.append(tko2018Sessions["day3Workshop2"]!)
        sessionBlock.sessions.append(tko2018Sessions["day3Workshop3"]!)
        sessionBlock.sessions.append(tko2018Sessions["day3Workshop4"]!)
        sessionBlock.sessions.append(tko2018Sessions["day3Workshop5"]!)
        sessionBlock.sessions.append(tko2018Sessions["day3Workshop6"]!)
        return sessionBlock
    }(),
    {
        let sessionBlock = SessionBlock()
        sessionBlock.startTime = Date.date(year: 2018, month: 3, day: 3, hour: 10, minute: 0, second: 0)
        sessionBlock.endTime = Date.date(year: 2018, month: 3, day: 3, hour: 18, minute: 0, second: 0)
        sessionBlock.sessions.append(tko2018Sessions["day3PeerLabs"]!)
        return sessionBlock
    }(),
]

