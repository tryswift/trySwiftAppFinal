//
//  Sponsor.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

public enum SponsorLevel: Int {
    case platinum = 0
    case gold = 1
    case silver = 2
    case diversity = 3
    case student = 4
    case event = 5
    case lanyard = 6
    case bag = 7
    case individual = 8
}

public class Sponsor {
    public var name: String = ""
    public var nameJP: String?
    public var url: String?
    public var displayURL: String?
    public var twitter: String?
    public var logoAssetName: String?
    public var logoImageWebURL: String?
    public var level: SponsorLevel = .event
    public var priority: Int = 0
    

    public var localizedName: String {
        return localizedString(for: name, japaneseString: nameJP)
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
    public class var all: [Int : [Sponsor]] {

        var resultsSet = [ Int : [Sponsor] ]()
        for i in 0...SponsorLevel.individual.rawValue {
            let sponsors = tko2018Sponsors.filter { $0.value.level.rawValue == i }
            
            if sponsors.count > 0 {
                let sponsorsSorted = sponsors.sorted { $0.value.priority < $1.value.priority }
                resultsSet[i] = sponsorsSorted.map { $0.value }
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
        case .lanyard:      return "Lanyard".localized()
        case .bag:          return "Bag".localized()
        case .individual:   return "Individual".localized()
        }
    }
}

