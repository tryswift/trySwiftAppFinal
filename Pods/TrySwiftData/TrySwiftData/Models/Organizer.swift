//
//  Organizer.swift
//  Pods
//
//  Created by Tim Oliver on 2/16/17.
//
//

import Foundation

public class Organizer {
    public var id: Int = 0
    public var name: String = "TBD"
    public var nameJP: String?
    public var twitter: String = "TBD"
    public var imageAssetName: String? = nil
    public var imageWebURL: String? = nil
    public var bio: String = "TBD"
    public var bioJP: String?
    public var hidden: Bool = false

    public static var all: [String : Organizer] {
        let organizers =  tko2018Organizers.filter { $0.value.hidden == false}
        let sortedOrganizers = organizers.sorted{ $0.value.name > $1.value.name }
        return sortedOrganizers.dictionary()
    }

    public var localizedName: String {
        return localizedString(for: name, japaneseString: nameJP)
    }

    public var localizedBio: String {
        return localizedString(for: bio, japaneseString: bioJP)
    }

    public var imageURL: URL {
        if let url = imageWebURL {
            return URL(string: url)!
        }

        if let assetName = imageAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }
}
