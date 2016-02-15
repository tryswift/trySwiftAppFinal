//
//  SponsorTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class SponsorTableViewCell: UITableViewCell {

    @IBOutlet weak var sponsorImageView: UIImageView!
    @IBOutlet weak var sponsorNameLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        websiteLabel.textColor = UIColor.twitterBlue()
    }
    
    func configure(withSponsor sponsor: Sponsor) {
        
        ImageCache.sharedInstance.retrieveImage(forKey: sponsor.logo) { maybeImage in
            guard let image = maybeImage else {
                return
            }
            self.sponsorImageView.image = image
        }

        sponsorNameLabel.text = sponsor.name
        websiteLabel.text = sponsor.website
    }

    
}
