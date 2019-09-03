//
//  Speaker.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

public enum SpeakerType: Int {
    case presentation
    case lightningTalk
    case instructor
    case emcee
}

public struct Speaker {
    public let id: Int
    public let name: String
    public let nameJP: String?
    public let twitter: String
    public let imageAssetName: String?
    public let imageWebURL: String?
    public let bio: String
    public let bioJP: String?
    public let hidden: Bool
    public let type: SpeakerType

    
    init(id: Int,
         name: String,
         nameJP: String? = nil,
         twitter: String,
         imageAssetName: String?,
         imageWebURL: String? = nil,
         bio: String,
         bioJP: String? = nil,
         hidden: Bool = false,
         type: SpeakerType = .presentation) {
        self.id = id
        self.name = name
        self.nameJP = nameJP
        self.twitter = twitter
        self.imageAssetName = imageAssetName
        self.imageWebURL = imageWebURL
        self.bio = bio
        self.bioJP = bioJP
        self.hidden = hidden
        self.type = type
    }
    
    public static var all: [Speaker] {
        let speakers = nyc2019Speakers.values.filter { $0.hidden == false}
        return speakers.sorted { $0.name < $1.name }
    }

    public var localizedName: String {
        return localizedString(for: name, japaneseString: nameJP)
    }

    public var localizedBio: String {
        return localizedString(for: bio, japaneseString: bioJP)
    }

    public var imageURL: URL? {
        if let url = imageWebURL, !url.isEmpty {
            return URL(string: url)!
        }

        if let assetName = imageAssetName {
            return Bundle.trySwiftAssetURL(for: assetName)!
        }

        return Bundle.trySwiftAssetURL(for: "Logo.png")!
    }
}


