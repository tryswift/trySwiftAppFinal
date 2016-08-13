//
//  Conference.swift
//  trySwift
//
//  Created by Bas Broek on 04/08/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct Conference {
    let name: String
    let twitter: String
    let image: UIImage?
    let imageURL: String?
    let description: String
}
extension Conference {
    
    static let trySwift = Conference(
        name: "try! Conference",
        twitter: "tryswiftnyc",
        image: UIImage(named: "logo"),
        imageURL: nil,
        description: "try! Conference is an immersive community gathering about Swift Language Best Practices, Application Development in Swift, Server-Side Swift, Open Source Swift, and the Swift Community, taking place in New York City on September 1st and 2nd, 2016.")
}
