//
//  Sponsor.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation

public enum SponsorLevel: Int {
    case diamond
    case platinum
    case gold
    case silver
    case diversity
    case student
    case event
    case lanyard
    case bag
    case individual
    case community
}

public struct Sponsor {
    public let name: String
    public let nameJP: String?
    public let url: String
    public let displayURL: String
    public let twitter: String?
    public let logoAssetName: String?
    public let level: SponsorLevel
    public let priority: Int
    
    init(name: String,
         nameJP: String? = nil,
         url: String,
         displayURL: String,
         twitter: String? = nil,
         logoAssetName: String?,
         level: SponsorLevel,
         priority: Int
        ) {
        self.name = name
        self.nameJP = nameJP
        self.url = url
        self.displayURL = displayURL
        self.twitter = twitter
        self.logoAssetName = logoAssetName
        self.level = level
        self.priority = priority
    }

    public var localizedName: String {
        return localizedString(for: name, japaneseString: nameJP)
    }

    public var logoURL: URL {
        if let assetName = logoAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }

    /* Return an array of `Results` objects */
    public static var all: [Int : [Sponsor]] {

        var resultsSet = [ Int : [Sponsor] ]()
        for i in 0...SponsorLevel.individual.rawValue {
            let sponsors = nyc2019Sponsors.filter { $0.value.level.rawValue == i }
            
            if sponsors.count > 0 {
                let sponsorsSorted = sponsors.sorted { $0.value.priority < $1.value.priority }
//                let sponsorsSorted = sponsors.sorted { $0.value.name < $1.value.name }
                resultsSet[i] = sponsorsSorted.map { $0.value }
            }
        }
        
        return resultsSet
    }

    public static func localizedName(for sponsorLevel: SponsorLevel) -> String {
        switch sponsorLevel {
        case .diamond:      return "Diamond".localized()
        case .platinum:     return "Platinum".localized()
        case .gold:         return "Gold".localized()
        case .silver:       return "Silver".localized()
        case .diversity:    return "Diversity".localized()
        case .student:      return "Student".localized()
        case .event:        return "Event".localized()
        case .lanyard:      return "Lanyard".localized()
        case .bag:          return "Bag".localized()
        case .individual:   return "Individual".localized()
        case .community:    return "Community".localized()
        }
    }
}

