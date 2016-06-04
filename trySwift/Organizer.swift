//
//  Organizer.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan
import Freddy

struct Organizer {
    let name: String
    let twitter: String
    let image: UIImage?
    let imageURL: String?
}

extension Organizer: JSONDecodable {
    
    init(json: JSON) throws {
        self.name = try json.string("name")
        self.twitter = try json.string("twitter")
        if let
            imageString = try json.string("image", ifNull: true),
            image = UIImage(named: imageString) {
            self.image = Toucan(image: image).maskWithEllipse().image
        } else {
            self.image = nil
        }
        self.imageURL = try json.string("imageURL", ifNull: true)
    }
}

extension Organizer {

    static let organizers: [Organizer] = {
        do {
            return try JSONManager.dataJSON().array("speakers").filter { try $0.bool("organizer") }.map(Organizer.init)
        } catch {
            print(error)
            return []
        }
    }()
    
    static let trySwift = Organizer(
        name: "try! Conference",
        twitter: "tryswiftconf",
        image: Toucan(image: UIImage(named: "logo")!).maskWithEllipse().image,
        imageURL: nil
    )
}
