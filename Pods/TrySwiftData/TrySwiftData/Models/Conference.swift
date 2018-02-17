//
//  Conference.swift
//  trySwift
//
//  Created by Bas Broek on 04/08/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

public class Conference: Object {
    @objc open dynamic var name: String?
    @objc open dynamic var twitter: String?
    @objc open dynamic var logoAssetName: String?
    @objc open dynamic var logoImageWebURL: String?
    @objc open dynamic var conferenceDescription: String = ""
    @objc open dynamic var conferenceDescriptionJP: String?
    @objc open dynamic var email: String = "info@tryswift.co"
    @objc open dynamic var slackURL: String = ""
    @objc open dynamic var githubIssuesURL: String = "https://github.com/tryswift/trySwiftAppFinal/issues"
    @objc open dynamic var codeOfConductURL: String = "https://www.tryswift.co/code-of-conduct/"
    open let venues = List<Venue>()
    open let organizers = List<Organizer>()

    public var localizedDescription: String {
        return self.localizedString(for: conferenceDescription, japaneseString: conferenceDescriptionJP)
    }

    public static var current: Conference {
        let realm = try! Realm.trySwiftRealm()
        return realm.objects(Conference.self).first!
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
