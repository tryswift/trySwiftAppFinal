//
//  Conference.swift
//  trySwift
//
//  Created by Bas Broek on 04/08/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

public struct Conference {
    public let name: String
    public let twitter: String
    public let logoAssetName: String?
    public let conferenceDescription: String
    public let conferenceDescriptionJP: String?
    public let email: String
    public let slackURL: String
    public let slackTeamID: String
    public let githubIssuesURL = "https://github.com/tryswift/trySwiftAppFinal/issues"
    public let codeOfConductURL = "https://www.tryswift.co/code-of-conduct/"
    public let venues: [Venue]
    public let organizers: [Organizer]
    public let emojiSet: String
    public let timezone: String
    public let dateFormat: String

    class BundleIdenifier { }
    static var conferenceBundle: Bundle { return Bundle(for: Conference.BundleIdenifier.self) }
    
    public var localizedDescription: String {
        return localizedString(for: conferenceDescription, japaneseString: conferenceDescriptionJP)
    }

    public static var current: Conference {
        return nyc2018Conferences.first!
    }

    public var logoURL: URL {
        if let assetName = logoAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }
}
