//
//  Venue.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/15/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Contacts

public enum VenueType: Int {
    case conference
    case hackathon
    case party
    case workshop
}

public class Venue {
    public var title: String = ""
    public var titleJP: String?
    public var address: String = ""
    public var addressJP: String?
    public var website: String?
    public var twitter: String?
    public var logoAssetName: String?
    public var logoImageWebURL: String?
    public var wifiNetworkName: String?
    public var wifiUsername: String?
    public var wifiPassword: String?
    public var type: VenueType = .conference

    public var localizedTitle: String {
        return localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedAddress: String {
        return localizedString(for: address, japaneseString: addressJP)
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
