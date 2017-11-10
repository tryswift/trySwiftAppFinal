//
//  Location.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import UIKit
import RealmSwift

public class Location: Object {
    @objc open dynamic var name: String = ""
    @objc open dynamic var nameJP: String?

    public var localizedName: String {
        return self.localizedString(for: name, japaneseString: nameJP)
    }
}
