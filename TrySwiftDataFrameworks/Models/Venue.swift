//
//  Venue.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/15/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Contacts

public struct Venue {
    public let title: String
    public let address: String
    public let formattedAddress: NSAttributedString
    public let website: String
    public let twitter: String
    public let logo: String
    public let wifiInfo: WifiInfo
}

public struct WifiInfo {
    public let networkName: String
    public let username: String?
    public let password: String?
}

public extension Venue {
    
    static let axa = Venue(
        title: "AXA Event & Production Center",
        address: "787 Seventh Ave, New York, NY 10019",
        formattedAddress: {
            let address = CNMutablePostalAddress()
            address.street = "787 Seventh Ave"
            address.city = "New York"
            address.state = "NY"
            address.postalCode = "10019"
            address.country = "United States"
            
            let addressFormatter = CNPostalAddressFormatter()
            let addressText = addressFormatter.attributedString(from: address, withDefaultAttributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 18.0)])
            return addressText
        }(),
        website: "axaeventproductioncenter.com",
        twitter: "AXACenter_NYC",
        logo: "axa",
        wifiInfo: WifiInfo(networkName: "AXA Auditorium",
            username: nil,
            password: nil))
    
    static let americanBeauty = Venue(
        title: "American Beauty NYC",
        address: "251 W 30th St, New York, NY 10001",
        formattedAddress: {
            let address = CNMutablePostalAddress()
            address.street = "251 W 30th St"
            address.city = "New York"
            address.state = "NY"
            address.postalCode = "10001"
            address.country = "United States"
            
            let addressFormatter = CNPostalAddressFormatter()
            let addressText = addressFormatter.attributedString(from: address, withDefaultAttributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 18.0)])
            return addressText
        }(),
        website: "americanbeautynyc.com",
        twitter: "ambeauty_nyc",
        logo: "americanBar",
        wifiInfo: WifiInfo(networkName: "American Beauty NYC",
            username: "251W30_Internal",
            password: "Slake251"))
}
