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

public struct Venue {
    public let title: String
    public let titleJP: String?
    public let address: String
    public let addressJP: String?
    public let displayAddress: String?
    public let website: String?
    public let twitter: String?
    public let logoAssetName: String?
    public let wifiNetworkName: String?
    public let wifiUsername: String?
    public let wifiPassword: String?
    public let type: VenueType

    public var localizedTitle: String {
        return localizedString(for: title, japaneseString: titleJP)
    }

    public var localizedAddress: String {
        return localizedString(for: address, japaneseString: addressJP)
    }

    public var logoURL: URL {
        if let assetName = logoAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }

    public static func localizedName(for venueType: VenueType) -> String {
        switch venueType {
        case .conference: return "Conference".localized()
        case .hackathon:  return "Hackathon".localized()
        case .party:      return "Party".localized()
        case .workshop:   return "Workshop".localized()
        }
    }
}
