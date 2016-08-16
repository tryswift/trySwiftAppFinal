//
//  Venue.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/15/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Contacts

struct Venue {
    let title: String
    let address: String
    let formattedAddress: NSAttributedString
    let website: String
    let twitter: String
    let logo: String
    let wifiInfo: WifiInfo
}

struct WifiInfo {
    let networkName: String
    let username: String?
    let password: String?
}

extension Venue {
    
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
            let addressText = addressFormatter.attributedStringFromPostalAddress(address, withDefaultAttributes: [NSFontAttributeName : UIFont.systemFontOfSize(18.0)])
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
            let addressText = addressFormatter.attributedStringFromPostalAddress(address, withDefaultAttributes: [NSFontAttributeName : UIFont.systemFontOfSize(18.0)])
            return addressText
        }(),
        website: "americanbeautynyc.com",
        twitter: "ambeauty_nyc",
        logo: "americanBar",
        wifiInfo: WifiInfo(networkName: "American Beauty NYC",
            username: "251W30_Internal",
            password: "Slake251"))
}
