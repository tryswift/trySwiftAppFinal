//
//  Speaker.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan
import Freddy

struct Speaker {
    let id: Int
    let name: String
    let twitter: String
    let image: UIImage?
    let imageURL: String?
    let bio: String
    let presentation: Presentation
}

extension Speaker: JSONDecodable {
    
    init(json: JSON) throws {
        self.id = try json.int("id")
        self.name = try json.string("name")
        self.twitter = try json.string("twitter", ifNull: true) ?? ""
        if let
            imageString = try json.string("image", ifNull: true),
            image = UIImage(named: imageString) {
                self.image = Toucan(image: image).maskWithEllipse().image
        } else {
            self.image = nil
        }
        self.imageURL = try json.string("imageURL", ifNull: true)
        self.bio = try json.string("bio")
        self.presentation = try Presentation(json: JSON(json.dictionary("presentation")))
    }
}

extension Speaker {
    
    static let speakers: [Speaker] = {
        do {
            return try JSONManager.dataJSON().array("speakers").filter { try !$0.bool("organizer") }.map(Speaker.init)
        } catch {
            print(error)
            return []
        }
    }()
}
