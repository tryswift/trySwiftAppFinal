//
//  ConferenceDay.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import RealmSwift

public class ConferenceDay: Object {
    /* The date of this particular day of the conference. */
    @objc open dynamic var date: Date = Date()

    /* The list of sessions, sorted into time blocks for that day. */
    open let sessionBlocks = List<SessionBlock>()

    public static var all: Results<ConferenceDay> {
        let realm = try! Realm.trySwiftRealm()
        return realm.objects(ConferenceDay.self).sorted(byKeyPath: "date")
    }
}
