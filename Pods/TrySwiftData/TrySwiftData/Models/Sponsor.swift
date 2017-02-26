//
//  Sponsor.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

@objc public enum SponsorLevel: Int {
    case platinum = 0
    case gold = 1
    case silver = 2
    case diversity = 3
    case student = 4
    case event = 5
}

public class Sponsor: Object {
    open dynamic var name: String = ""
    open dynamic var nameJP: String?
    open dynamic var url: String?
    open dynamic var displayURL: String?
    open dynamic var twitter: String?
    open dynamic var logoAssetName: String?
    open dynamic var logoImageWebURL: String?
    open dynamic var level: SponsorLevel = .event

    public var localizedName: String {
        return self.localizedString(for: name, japaneseString: nameJP)
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

    /* Return an array of `Results` objects */
    public class var all: [Results<Sponsor>] {
        let realm = try! Realm.trySwiftRealm()

        var resultsSet = [Results<Sponsor>]()
        for i in 0...SponsorLevel.event.rawValue {
            let sponsors = realm.objects(Sponsor.self).filter("level == %d", i)
            if sponsors.count > 0 {
                resultsSet.append(sponsors)
            }
        }

        return resultsSet
    }

    public class func localizedName(for sponsorLevel: SponsorLevel) -> String {
        switch sponsorLevel {
        case .platinum:     return "Platinum".localized()
        case .gold:         return "Gold".localized()
        case .silver:       return "Silver".localized()
        case .diversity:    return "Diversity".localized()
        case .student:      return "Student".localized()
        case .event:        return "Event".localized()
        }
        
        return ""
    }
}

