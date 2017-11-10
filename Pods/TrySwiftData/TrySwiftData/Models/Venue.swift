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
    case workshop
}

public class Venue: Object {
    @objc open dynamic var title: String = ""
    @objc open dynamic var titleJP: String?
    @objc open dynamic var address: String = ""
    @objc open dynamic var addressJP: String?
    @objc open dynamic var website: String?
    @objc open dynamic var twitter: String?
    @objc open dynamic var logoAssetName: String?
    @objc open dynamic var logoImageWebURL: String?
    @objc open dynamic var wifiNetworkName: String?
    @objc open dynamic var wifiUsername: String?
    @objc open dynamic var wifiPassword: String?
    @objc open dynamic var type: VenueType = .conference

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
        case .workshop:   return "Workshop".localized()
        }
    }
}
