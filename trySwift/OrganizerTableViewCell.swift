//
//  OrganizerTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Kingfisher
import TrySwiftData

class OrganizerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var organizerImageView: UIImageView!
    @IBOutlet weak var organizerNameLabel: UILabel!
    @IBOutlet weak var organizerTwitterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        organizerTwitterLabel.textColor = .trySwiftAccentColor
    }
    
    func configure(withOrganizer organizer: Organizer, selectionEnabled: Bool = true, accessoryEnabled: Bool = true) {

        let scale = UIScreen.main.scale
        let processor = RoundCornerImageProcessor(cornerRadius: 34, targetSize: CGSize(width: 67, height: 67))
        organizerImageView.kf.setImage(with: organizer.imageURL, placeholder: nil, options: [.processor(processor), .scaleFactor(scale)])
        organizerNameLabel.text = organizer.localizedName
        organizerTwitterLabel.text = "@\(organizer.twitter)"
        
        if !selectionEnabled {
            selectionStyle = .none
        }
        
        if !accessoryEnabled {
            accessoryType = .none
        }
    }
    
    func configure(withConference conference: Conference) {
        let scale = UIScreen.main.scale
        let processor = RoundCornerImageProcessor(cornerRadius: 34, targetSize: CGSize(width: 67, height: 67))
        organizerImageView.kf.setImage(with: conference.logoURL, placeholder: nil, options: [.processor(processor), .scaleFactor(scale)])
        organizerNameLabel.text = conference.name
        organizerTwitterLabel.text = "@\(conference.twitter!)"
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
