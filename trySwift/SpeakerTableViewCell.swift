//
//  SpeakerTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Haneke
import Toucan

class SpeakerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerTwitterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        speakerTwitterLabel.textColor = .twitterBlue()
    }
    
    func configure(withSpeaker speaker: Speaker, selectionEnabled: Bool = true, accessoryEnabled: Bool = true) {
        
        speakerImageView.image = Toucan(image: speaker.getImage()).maskWithEllipse().image
        speakerNameLabel.text = speaker.name
        speakerTwitterLabel.text = "@\(speaker.twitter)"
        
        if !selectionEnabled {
            selectionStyle = .None
        }
        
        if !accessoryEnabled {
            accessoryType = .None
        }
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
