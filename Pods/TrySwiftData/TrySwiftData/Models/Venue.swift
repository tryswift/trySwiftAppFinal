//
//  Venue.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/15/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift
import Contacts

@objc public enum VenueType: Int {
    case conference
    case hackathon
    case party
}

public class Venue: Object {
    open dynamic var title: String = ""
    open dynamic var titleJP: String?
    open dynamic var address: String = ""
    open dynamic var addressJP: String?
    open dynamic var website: String?
    open dynamic var twitter: String?
    open dynamic var logoAssetName: String?
    open dynamic var logoImageWebURL: String?
    open dynamic var wifiNetworkName: String?
    open dynamic var wifiUsername: String?
    open dynamic var wifiPassword: String?
    open dynamic var type: VenueType = .conference

    public var localizedTitle: String {
        return self.localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedAddress: String {
        return self.localizedString(for: address, japaneseString: addressJP)
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

    public class func localizedName(for venueType: VenueType) -> String {
        switch venueType {
        case .conference: return "Conference".localized()
        case .hackathon:  return "Hackathon".localized()
        case .party:      return "Party".localized()
        }
    }
}
