//
//  VenueHeaderTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/13/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData
import Kingfisher

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

        let scale = UIScreen.main.scale
        let processor = RoundCornerImageProcessor(cornerRadius: 34, targetSize: CGSize(width: 67, height: 67))
        venueImageView.kf.setImage(with: venue.logoURL, placeholder: nil, options: [.processor(processor), .scaleFactor(scale)])
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
