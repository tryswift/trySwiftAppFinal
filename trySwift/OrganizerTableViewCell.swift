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
    
    func configure(withOrganizer organizer: Organizer, selectionEnabled: Bool = true, accessoryEnabled: Bool = true) {
        
        organizerImageView.image = Toucan(image: organizer.image).maskWithEllipse().image
        organizerNameLabel.text = organizer.name
        organizerTwitterLabel.text = "@\(organizer.twitter)"
        
        if !selectionEnabled {
            selectionStyle = .None
        }
        
        if !accessoryEnabled {
            accessoryType = .None
        }
    }
    
    func configure(withConference conference: Conference) {
        if let
            imageURLString = conference.imageURL,
            imageURL = NSURL(string: imageURLString) {
            organizerImageView.hnk_setImageFromURL(imageURL, placeholder: conference.image) { image in
                self.organizerImageView.image = Toucan(image: image).maskWithEllipse().image
            }
        } else {
            organizerImageView.image = conference.image
        }
        organizerNameLabel.text = conference.name
        organizerTwitterLabel.text = "@\(conference.twitter)"
    }
}
