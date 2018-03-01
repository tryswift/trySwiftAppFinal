//
//  NYC2016Venues.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let tko2018Venues: [String : Venue] = [
    "bellesalle-shinjuku" : {
        let venue = Venue()
        venue.title = "BELLESALLE Shinjuku Grand Conference Center"
        venue.titleJP = "ベルサール新宿グランドコンファレンスセンター"
        venue.address = "8-17−１ Nishishinjuku , Shinjuku-ku, Tokyo, 160-0023"
        venue.addressJP = "〒160-0023 東京都新宿区Nishishinjuku, 西新宿8-17−１ 住友不動産新宿グランドタワー"
        venue.website = "https://www.bellesalle.co.jp/shisetsu/shinjuku/bs_shinjukugrand"
        venue.logoAssetName = "hallA.jpg"
        venue.type = .conference
        venue.wifiNetworkName = "tryswift"
        venue.wifiPassword = "iloveswift"
        return venue
    }(),
    "casareal" : {
        let venue = Venue()
        venue.title = "Casareal"
        venue.titleJP = "Casareal"
        venue.address = "3-11-24 Mita, Minato-ku, Tokyo, 108-0073"
        venue.addressJP = "〒108-0073 Tōkyō-to, Minato-ku, Mita, 3 Chome−11−24"
        venue.website = "casareal.co.jp"
        venue.logoAssetName = "casareal-venue.jpg"
        venue.type = .workshop
        return venue
    }(),
    "dena" : {
        let venue = Venue()
        venue.title = "DeNA"
        venue.titleJP = "DeNA"
        venue.address = "2 Chome-21-1 Shibuya, Shibuya-ku, Tokyo, 150-8510"
        venue.addressJP = "2 Chome-21-1 Shibuya, 渋谷区 Shibuya-ku, Tōkyō-to 150-8510"
        venue.website = "dena.com/jp"
        venue.logoAssetName = "dena-venue.jpg"
        venue.type = .workshop
        return venue
    }(),
    "line" : {
        let venue = Venue()
        venue.title = "LINE"
        venue.titleJP = "LINE株式会社"
        venue.address = "4 Chome-1-6 Shinjuku, Shinjuku-ku, Tōkyō-to 160-0022"
        venue.addressJP = "4 Chome-1-6 Shinjuku, Shinjuku-ku, Tōkyō-to 160-0022"
        venue.website = "engineering.linecorp.com"
        venue.logoAssetName = "line-venue.jpg"
        venue.type = .workshop
        return venue
    }(),
    
]
