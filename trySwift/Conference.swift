//
//  Conference.swift
//  trySwift
//
//  Created by Bas Broek on 04/08/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import Toucan
import Freddy

struct Conference {
    let name: String
    let twitter: String
    let image: UIImage?
    let imageURL: String?
    let description: String
}

extension Conference: JSONDecodable {
    
    init(json: JSON) throws {
        self.name = try json.string("name")
        self.twitter = try json.string("twitter")
        if let
            imageString = try json.string("image", alongPath: [.NullBecomesNil]),
            image = UIImage(named: imageString) {
            self.image = Toucan(image: image).maskWithEllipse().image
        } else {
            self.image = nil
        }
        self.imageURL = try json.string("imageURL", alongPath: [.NullBecomesNil])
        self.description = try json.string("description")
    }
}

extension Conference {
    
    static let trySwift: Conference = {
        do {
            let json = try JSON(JSONManager.dataJSON().dictionary("conference"))
            return try Conference(json: json)
        } catch {
            print(error)
            return _fallback
        }
    }()
    
    private static let _fallback: Conference = {
        return Conference(
            name: "try! Conference",
            twitter: "tryswiftnyc",
            image: UIImage(named: "logo"),
            imageURL: nil,
            description: "try! Conference is an immersive community gathering about Swift Language Best Practices, Application Development in Swift, Server-Side Swift, Open Source Swift, and the Swift Community. It will take place in New York City on September 1st and 2nd.")
    }()
}
