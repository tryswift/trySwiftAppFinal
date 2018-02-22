//
//  Conference.swift
//  trySwift
//
//  Created by Bas Broek on 04/08/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

public class Conference {
    public var name: String?
    public var twitter: String?
    public var logoAssetName: String?
    public var logoImageWebURL: String?
    public var conferenceDescription: String = ""
    public var conferenceDescriptionJP: String?
    public var email: String = "info@tryswift.co"
    public var slackURL: String = ""
    public var githubIssuesURL: String = "https://github.com/tryswift/trySwiftAppFinal/issues"
    public var codeOfConductURL: String = "https://www.tryswift.co/code-of-conduct/"
    public var venues = [Venue]()
    public var organizers = [Organizer]()

    public var localizedDescription: String {
        return localizedString(for: conferenceDescription, japaneseString: conferenceDescriptionJP)
    }

    public static var current: Conference {
        return tko2018Conferences.first!
    }

    public var logoURL: URL {
        if let url = logoImageWebURL {
            return URL(string: url)!
        }

        if let assetName = logoAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }
}
