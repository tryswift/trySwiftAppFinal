//
//  Sponsor.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Freddy

struct Sponsor {
    
    enum Level: Int, CustomStringConvertible {
        case /*Diamond, */Gold, Silver, Diversity, Student, Event
        
        var description: String {
            switch self {
//            case .Diamond:
//                return "Diamond"
            case .Gold:
                return "Gold Sponsors"
            case .Silver:
                return "Silver Sponsors"
            case .Diversity:
                return "Diversity Sponsors"
            case .Student:
              return "Student Sponsors"
            case .Event:
                return "Event Partners"
            }
        }
    }
    
    let name: String
    let website: String
    let twitter: String?
    let logo: UIImage?
    let logoURL: String?
    let level: Level
    let description: String?
}

extension Sponsor: JSONDecodable {
    
    init(json: JSON) throws {
        self.name = try json.string("name")
        self.website = try json.string("website")
        self.twitter = try json.string("twitter", alongPath: [.NullBecomesNil])
        self.logo = try UIImage(named: json.string("logo", alongPath: [.NullBecomesNil]) ?? "invalid")
        self.logoURL = try json.string("logoURL", alongPath: [.NullBecomesNil])
        self.level = try Level(rawValue: json.int("level"))!
        self.description = try json.string("description", alongPath: [.NullBecomesNil])
    }
}

extension Sponsor {
    
    static let sponsors: [Sponsor] = {
        do {
            return try JSONManager.dataJSON().array("sponsors").map(Sponsor.init)
        } catch {
            print(error)
            return []
        }
    }()
    
//    static let diamondSponsors: [Sponsor] = {
//        return sponsors.filter { $0.level == .Diamond }
//    }()
    
    static let goldSponsors: [Sponsor] = {
        return sponsors.filter { $0.level == .Gold }
    }()
    
    static let silverSponsors: [Sponsor] = {
        return sponsors.filter { $0.level == .Silver }
    }()
    
    static let diversitySponsors: [Sponsor] = {
        return sponsors.filter { $0.level == .Diversity }
    }()
    
    static let studentSponsors: [Sponsor] = {
        return sponsors.filter { $0.level == .Student }
    }()
    
    static let eventPartners: [Sponsor] = {
        return sponsors.filter { $0.level == .Event }
    }()
}