//
//  Speaker.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import RealmSwift

class Speaker: Object {
    dynamic var id: Int = 0
    dynamic var name: String = "TBD"
    dynamic var twitter: String = "TBD"
    dynamic var imageName: String = "tryLogo"
    
    override static func indexedProperties() -> [String] {
        return ["id", "name"]
    }
    
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
    
    private class var speakers: Results<Speaker> {
        let realm = try! Realm()
        return realm.objects(Speaker).filter("hidden == false").sorted("name")
    }
}

let defaultSpeakers: [Speaker] = [
    { let ellen = Speaker()
        ellen.id = 1
        ellen.name = "Ellen Shapiro"
        ellen.twitter = "designatednerd"
        ellen.imageName = "ellen_shapiro"
        return ellen
    }(),
    { let marc = Speaker()
        marc.id = 2
        marc.name = "Marc Brown"
        marc.twitter = "heymarcbrown"
        marc.imageName = "marc_brown"
        return marc
    }(),
    { let rob = Speaker()
        rob.id = 3
        rob.name = "Rob Napier"
        rob.twitter = "cocoaphony"
        rob.imageName = "rob_napier"
        return rob
    }(),
    { let dani = Speaker()
        dani.id = 4
        dani.name = "Daniel Tomlinson"
        dani.twitter = "dantoml"
        dani.imageName = "daniel_tomlinson"
        return dani
    }(),
    { let natalia = Speaker()
        natalia.id = 5
        natalia.name = "Natalia Berdys"
        natalia.twitter = "batalia"
        natalia.imageName = "natalia_berdys"
        return natalia
    }(),
    { let andyy = Speaker()
        andyy.id = 6
        andyy.name = "Andyy Hope"
        andyy.twitter = "AndyyHope"
        andyy.imageName = "andyy_hope"
        return andyy
    }(),
    { let kristina = Speaker()
        kristina.id = 7
        kristina.name = "Kristina Thai"
        kristina.twitter = "kristinathai"
        kristina.imageName = "kristina_thai"
        return kristina
    }(),
    { let jorge = Speaker()
        jorge.id = 8
        jorge.name = "Jorge Ortiz"
        jorge.twitter = "jdortiz"
        jorge.imageName = "jorge_ortiz"
        return jorge
    }(),
    { let vixentael = Speaker()
        vixentael.id = 9
        vixentael.name = "Anastasiia Voitova"
        vixentael.twitter = "vixentael"
        vixentael.imageName = "anastasiia_voitova"
        return vixentael
    }(),
    { let anat = Speaker()
        anat.id = 10
        anat.name = "Anat Gilboa"
        anat.twitter = "anat_gilboa"
        anat.imageName = "anat_gilboa"
        return anat
    }(),
    { let amy = Speaker()
        amy.id = 11
        amy.name = "Amy Dyer"
        amy.twitter = "Etsy"
        amy.imageName = "amy_dyer"
        return amy
    }(),
    { let sam = Speaker()
        sam.id = 12
        sam.name = "Samuel Giddins"
        sam.twitter = "segiddins"
        sam.imageName = "samuel_giddins"
        return sam
    }(),
    { let hector = Speaker()
        hector.id = 13
        hector.name = "Hector Matos"
        hector.twitter = "allonsykraken"
        hector.imageName = "hector_matos"
        return hector
    }(),
    { let tj = Speaker()
        tj.id = 14
        tj.name = "T.J. Usiyan"
        tj.twitter = "griotspeak"
        tj.imageName = "tj_usiyan"
        return tj
    }(),
    { let daniel = Speaker()
        daniel.id = 15
        daniel.name = "Daniel Jalkut"
        daniel.twitter = "danielpunkass"
        daniel.imageName = "daniel_jalkut"
        return daniel
    }(),
    { let bojana = Speaker()
        bojana.id = 16
        bojana.name = "Bojana Jam"
        bojana.twitter = "bojanajam"
        bojana.imageName = "bojana_jam"
        return bojana
    }(),
    { let saul = Speaker()
        saul.id = 17
        saul.name = "Saul Mora"
        saul.twitter = "casademora"
        saul.imageName = "saul_mora"
        return saul
    }(),
    { let marin = Speaker()
        marin.id = 18
        marin.name = "Marin Todorov"
        marin.twitter = "icanzilb"
        marin.imageName = "marin_todorov"
        return marin
    }(),
    { let natasha = Speaker()
        natasha.id = 19
        natasha.name = "Natasha Nazari"
        natasha.twitter = "natasha_nazari"
        natasha.imageName = "natasha_nazari"
        return natasha
    }(),
    { let erik = Speaker()
        erik.id = 20
        erik.name = "Erik Romijn"
        erik.twitter = "erikpub"
        erik.imageName = "erik_romijn"
        return erik
    }(),
    { let ryan = Speaker()
        ryan.id = 21
        ryan.name = "Ryan Nystrom"
        ryan.twitter = "_ryannystrom"
        ryan.imageName = "ryan_nystrom"
        return ryan
    }(),
    { let chrisBailey = Speaker()
        chrisBailey.id = 22
        chrisBailey.name = "Chris Bailey"
        chrisBailey.twitter = "Chris__Bailey"
        chrisBailey.imageName = "chris_bailey"
        return chrisBailey
    }(),
    { let katsumi = Speaker()
        katsumi.id = 23
        katsumi.name = "Katsumi Kishikawa"
        katsumi.twitter = "k_katsumi"
        katsumi.imageName = "katsumi_kishikawa"
        return katsumi
    }(),
    { let cate = Speaker()
        cate.id = 24
        cate.name = "Cate Huston"
        cate.twitter = "catehstn"
        cate.imageName = "cate_huston"
        return cate
    }(),
    {
        let chrisBritt = Speaker()
        chrisBritt.id = 25
        chrisBritt.name = "Chris Britt"
        chrisBritt.twitter = "chrisbritt"
        chrisBritt.imageName = "chris_britt"
        return chrisBritt
    }(),
    {
        let robert = Speaker()
        robert.id = 26
        robert.name = "Robert Dickerson"
        robert.twitter = "rfdickerson"
        robert.imageName = "robert"
        return robert
    }(),
    {
        // special double speaker case
        let chrisRobert = Speaker()
        chrisRobert.id = 27
        chrisRobert.name = "Chris Bailey & Robert Dickerson"
        chrisRobert.twitter = "IBM"
        chrisRobert.imageName = "chris_robert"
        return chrisRobert
    }()
]