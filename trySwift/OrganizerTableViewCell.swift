//
//  OrganizerTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Haneke
import Toucan

class OrganizerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var organizerImageView: UIImageView!
    @IBOutlet weak var organizerNameLabel: UILabel!
    @IBOutlet weak var organizerTwitterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        organizerTwitterLabel.textColor = .twitterBlue()
    }
    
    func configure(withOrganizer organizer: Organizer) {
        if let
            imageURLString = organizer.imageURL,
            imageURL = NSURL(string: imageURLString) {
            organizerImageView.hnk_setImageFromURL(imageURL, placeholder: organizer.image) { image in
                self.organizerImageView.image = Toucan(image: image).maskWithEllipse().image
            }
        } else {
            organizerImageView.image = organizer.image
        }
        organizerNameLabel.text = organizer.name
        organizerTwitterLabel.text = "@\(organizer.twitter)"
    }    
}
