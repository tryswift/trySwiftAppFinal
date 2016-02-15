//
//  QASessionTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan

class QASessionTableViewCell: UITableViewCell {

    @IBOutlet weak var qaSessionTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var speaker1ImageView: UIImageView!
    @IBOutlet weak var speaker2ImageView: UIImageView!
    @IBOutlet weak var speaker3ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        qaSessionTitleLabel.textColor = .trySwiftTitleColor()
        locationLabel.textColor = .trySwiftSubtitleColor()
    }

    func configure(withQASession qaSession: QASession) {
        qaSessionTitleLabel.text = qaSession.title
        locationLabel.text = qaSession.location
        
        for (index, speakerImageView) in [speaker1ImageView, speaker2ImageView, speaker3ImageView].enumerate() {
            configureImageForSpeaker(qaSession.speakers[index], imageView: speakerImageView)
        }
    }
    
}

private extension QASessionTableViewCell {
    
    func configureImageForSpeaker(speaker: Speaker, imageView: UIImageView) {
        ImageCache.sharedInstance.retrieveImage(forKey: speaker.image) { maybeImage in
            guard let image = maybeImage else {
                imageView.image = UIImage.trySwiftDefaultImage
                return
            }
            imageView.image = Toucan(image: image).maskWithEllipse().image
        }
    }
}