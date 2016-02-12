//
//  Organizer.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan

struct Organizer {
    let name: String
    let twitter: String
    let image: UIImage
}

extension Organizer {
    
    static let organizers = [natasha, kk, caesar, tasanobu, helen, hector, vaish, minwoo]
    
    static let natasha = Organizer(
        name: isJapanese ? "ナターシャ ザ ロボット" : "Natasha Murashev",
        twitter: "NatashaTheRobot",
        image: Toucan(image: UIImage(named: "natasha")!).maskWithEllipse().image
    )
    
    static let kk = Organizer(
        name: isJapanese ? "Kishikawa Katsumi" : "Kishikawa Katsumi",
        twitter: "k_katsumi",
        image: Toucan(image: UIImage(named: "kk")!).maskWithEllipse().image
    )
    
    static let vaish = Organizer(
        name: "Vaishnavi Srinivasan",
        twitter: "vaish",
        image: Toucan(image: UIImage(named: "vaish")!).maskWithEllipse().image
    )
    
    static let helen = Organizer(
        name: "Helen Holmes",
        twitter: "helenvholmes",
        image: Toucan(image: UIImage(named: "hellenholmes")!).maskWithEllipse().image
    )
    
    static let caesar = Organizer(
        name: isJapanese ? "Caesar Wirth" : "Caesar Wirth",
        twitter: "cjwirth",
        image: Toucan(image: UIImage(named: "caesar")!).maskWithEllipse().image
    )
    
    static let minwoo = Organizer(
        name: "Minwoo Park",
        twitter: "tebica",
        image: Toucan(image: UIImage(named: "minwoo")!).maskWithEllipse().image
    )
    
    static let hector = Organizer(
        name: "Hector Matos",
        twitter: "allonsykraken",
        image: Toucan(image: UIImage(named: "hector")!).maskWithEllipse().image
    )

    static let tasanobu = Organizer(
        name: "Kazunobu Tasaka",
        twitter: "tasanobu",
        image: Toucan(image: UIImage(named: "tasanobu")!).maskWithEllipse().image
    )
}
