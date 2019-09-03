//
//  Organizer.swift
//  Pods
//
//  Created by Tim Oliver on 2/16/17.
//
//

import Foundation

public struct Organizer {
    public let id: Int
    public let name: String
    public let nameJP: String?
    public let twitter: String
    public let imageAssetName: String?
    public let bio: String
    public let bioJP: String?
    public let hidden: Bool

    public static var all: [Organizer] {
        // let organizers =  tko2019Organizers.filter { $0.value.hidden == false}
        //let sortedOrganizers = organizers.sorted { $0.value.name < $1.value.name }
        //return sortedOrganizers.dictionary()
        return nyc2019Organizers
    }

    public var localizedName: String {
        return localizedString(for: name, japaneseString: nameJP)
    }

    public var localizedBio: String {
        return localizedString(for: bio, japaneseString: bioJP)
    }

    public var imageURL: URL {
        if let assetName = imageAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }
}
