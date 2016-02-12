//
//  OrganizerTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class OrganizerTableViewCell: UITableViewCell {

    @IBOutlet weak var organizerImageView: UIImageView!
    @IBOutlet weak var organizerNameLabel: UILabel!
    @IBOutlet weak var organizerTwitterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        organizerTwitterLabel.textColor = UIColor.twitterBlue()
    }

    func configure(withOrganizer organizer: Organizer) {
        organizerImageView.image = organizer.image
        organizerNameLabel.text = organizer.name
        organizerTwitterLabel.text = "@\(organizer.twitter)"
    }
    
}
