//
//  Organizer.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct Organizer {
    let name: String
    let twitter: String
    let image: String
}

extension Organizer {
    
    static let organizers = [natasha, kk, caesar, tasanobu, helen, hector, vaish, minwoo]
    
    static let natasha = Organizer(
        name: isJapanese ? "ナターシャ ザ ロボット" : "Natasha Murashev",
        twitter: "NatashaTheRobot",
        image: "natasha"
    )
    
    static let kk = Organizer(
        name: isJapanese ? "岸川克己" : "Kishikawa Katsumi",
        twitter: "k_katsumi",
        image: "kk"
    )
    
    static let vaish = Organizer(
        name: "Vaishnavi Srinivasan",
        twitter: "vaish",
        image: "vaish"
    )
    
    static let helen = Organizer(
        name: "Helen Holmes",
        twitter: "helenvholmes",
        image: "hellenholmes"
    )
    
    static let caesar = Organizer(
        name: isJapanese ? "Caesar Wirth" : "Caesar Wirth",
        twitter: "cjwirth",
        image: "caesar"
    )
    
    static let minwoo = Organizer(
        name: "Minwoo Park",
        twitter: "tebica",
        image: "minwoo"
    )
    
    static let hector = Organizer(
        name: "Hector Matos",
        twitter: "allonsykraken",
        image: "hector"
    )

    static let tasanobu = Organizer(
        name: isJapanese ? "田坂和暢" : "Kazunobu Tasaka",
        twitter: "tasanobu",
        image: "tasanobu"
    )
    
    static let trySwift = Organizer(
        name: "try! Conference",
        twitter: "tryswiftconf",
        image: "logo"
    )
}
