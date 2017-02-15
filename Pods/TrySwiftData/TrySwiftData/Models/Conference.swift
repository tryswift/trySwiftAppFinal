//
//  Conference.swift
//  trySwift
//
//  Created by Bas Broek on 04/08/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

public class Conference: Object {
    open dynamic var name: String?
    open dynamic var twitter: String?
    open dynamic var imageName: String?
    open dynamic var imageURL: String?
    open dynamic var conferenceDescription: String = ""
    open dynamic var conferenceDescriptionJP: String?
    open dynamic var venue: Venue?
    open let organizers = List<Speaker>()

    public var localizedDescription: String {
        return self.localizedString(for: conferenceDescription, japaneseString: conferenceDescriptionJP)
    }

    public static var current: Conference {
        let realm = try! Realm.trySwiftRealm()
        return realm.objects(Conference.self).first!
    }
}
