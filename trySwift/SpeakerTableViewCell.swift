//
//  SpeakerTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Kingfisher
import TrySwiftData

class SpeakerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var speakerImageView: UIImageView! {
        didSet {
            speakerImageView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerTwitterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        speakerTwitterLabel.textColor = .trySwiftAccentColor()
    }
    
    func configure(withSpeaker speaker: Speaker, selectionEnabled: Bool = true, accessoryEnabled: Bool = true) {

        let scale = UIScreen.main.scale
        let processor = RoundCornerImageProcessor(cornerRadius: 34, targetSize: CGSize(width: 67, height: 67))
        speakerImageView.kf.setImage(with: speaker.imageURL, placeholder: nil, options: [.processor(processor), .scaleFactor(scale)])
        speakerNameLabel.text = speaker.localizedName
        speakerTwitterLabel.text = "@\(speaker.twitter)"
        
        if !selectionEnabled {
            selectionStyle = .none
        }
        
        if !accessoryEnabled {
            accessoryType = .none
        }
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
