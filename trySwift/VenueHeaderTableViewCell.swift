//
//  VenueHeaderTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/13/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan
import TrySwiftData

class VenueHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var venueImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withVenue venue: Venue) {
        titleLabel.text = venue.title
        websiteLabel.text = venue.website
        if let venueLogo = UIImage(named: venue.logo!) {
            venueImageView.image = Toucan(image: venueLogo).maskWithEllipse().image
        }
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
