//
//  SponsorTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Kingfisher
import TrySwiftData

class SponsorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sponsorImageView: UIImageView!
    @IBOutlet weak var sponsorNameLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        websiteLabel.textColor = .trySwiftAccentColor
    }
    
    func configure(withSponsor sponsor: Sponsor) {

        let scale = UIScreen.main.scale
        let processor = AspectResizingImageProcessor(targetSize: CGSize(width: 67, height: 67), contentMode: .scaleAspectFit)
        sponsorImageView.kf.setImage(with: sponsor.logoURL, placeholder: nil, options: [.processor(processor), .scaleFactor(scale)])
        sponsorNameLabel.text = sponsor.name
        websiteLabel.text = sponsor.displayURL
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
