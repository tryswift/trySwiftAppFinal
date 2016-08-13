//
//  Speaker.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

class Speaker: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var twitter: String = ""
    dynamic var imageName: String? = nil
    dynamic var bio: String = ""
    
    class var speakers: Results<Speaker> {
        let realm = try! Realm()
        return realm.objects(Speaker).sorted("name")
    }
}

extension Speaker {
    
    class func insertDefaultSpeakers() {
        if Speaker.speakers.count == 0 {
            
            let realm = try! Realm()
            try! realm.write {
                defaultSpeakers.forEach {
                    realm.add($0)
                }
            }
        }
    }
}

extension Speaker {
    
    private static let defaultSpeakers: [Speaker] = [
        { let ellen = Speaker()
            ellen.id = 1
            ellen.name = "Ellen Shapiro"
            ellen.twitter = "designatednerd"
            ellen.imageName = "ellen_shapiro"
            ellen.bio = "Ellen Shapiro is the Lead Mobile Developer for SpotHero and former Director of iOS Engineering at an Vokal in Chicago, IL. She also builds Android apps and runs the Chicago AndroidListener meetup. She works in her spare time to bring leading songwriting application Hum to life, and writes iOS tutorials for RayWenderlich.com."
            return ellen
        }(),
        
    ]
}


