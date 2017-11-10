//
//  Organizer.swift
//  Pods
//
//  Created by Tim Oliver on 2/16/17.
//
//

import Foundation
import RealmSwift

public class Organizer: Object {
    @objc open dynamic var id: Int = 0
    @objc open dynamic var name: String = "TBD"
    @objc open dynamic var nameJP: String?
    @objc open dynamic var twitter: String = "TBD"
    @objc open dynamic var imageAssetName: String? = nil
    @objc open dynamic var imageWebURL: String? = nil
    @objc open dynamic var bio: String = "TBD"
    @objc open dynamic var bioJP: String?
    @objc open dynamic var hidden: Bool = false

    public override static func primaryKey() -> String? {
        return "id"
    }

    public class var all: Results<Organizer> {
        let realm = try! Realm.trySwiftRealm()
        return realm.objects(Organizer.self).filter("hidden == false").sorted(byKeyPath: "name")
    }

    public var localizedName: String {
        return self.localizedString(for: name, japaneseString: nameJP)
    }

    public var localizedBio: String {
        return self.localizedString(for: bio, japaneseString: bioJP)
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
