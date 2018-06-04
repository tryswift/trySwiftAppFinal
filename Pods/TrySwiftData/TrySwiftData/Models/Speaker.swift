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
}

public class Speaker {
    public var id = 0
    public var name = "TBD"
    public var nameJP: String?
    public var twitter = "TBD"
    public var imageAssetName: String? = nil
    public var imageWebURL: String? = nil
    public var bio = "TBD"
    public var bioJP: String?
    public var hidden = false
    public var type: SpeakerType = .presentation

    public class var all: [Speaker] {
        let speakers = sjo2018Speakers.values.filter { $0.hidden == false}
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


