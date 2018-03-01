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
    
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerTwitterButton: UIButton!

    fileprivate var speaker: Speaker?
    fileprivate weak var delegate: TwitterFollowDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        speakerTwitterButton.setTitleColor(.trySwiftAccentColor(), for: .normal)
    }
    

    @IBAction func speakerTwitterButtonDidTap(_ sender: Any) {
        guard let speaker = speaker else {
          assertionFailure("Speaker is not set")
          return
        }
        self.delegate?.followUser(speaker.twitter)
    }

    func configure(withSpeaker speaker: Speaker, selectionEnabled: Bool = true, accessoryEnabled: Bool = true, delegate: TwitterFollowDelegate) {
        let scale = UIScreen.main.scale
        let processor = RoundCornerImageProcessor(cornerRadius: 34, targetSize: CGSize(width: 67, height: 67))
        speakerImageView.kf.setImage(with: speaker.imageURL, placeholder: nil, options: [.processor(processor), .scaleFactor(scale)])
        speakerNameLabel.text = speaker.localizedName
        speakerTwitterButton.setTitle("@\(speaker.twitter)", for: .normal)
        if !selectionEnabled {
            selectionStyle = .none
        }
        
        if !accessoryEnabled {
            accessoryType = .none
        }
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()

        self.speaker = speaker
        self.delegate = delegate
    }
}
