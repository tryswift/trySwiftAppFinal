//
//  QASessionTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Haneke
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
    
        if qaSession.speakers.count >= 1 {
            if let
                imageURLString = qaSession.speakers[0].imageURL,
                imageURL = NSURL(string: imageURLString) {
                    speaker1ImageView.hnk_setImageFromURL(imageURL, placeholder: qaSession.speakers[0].image) { image in
                        self.speaker1ImageView.image = Toucan(image: image).maskWithEllipse().image
                    }
            } else {
                speaker1ImageView.image = qaSession.speakers[0].image
            }
        }
        
        if qaSession.speakers.count >= 2 {
            if let
                imageURLString = qaSession.speakers[1].imageURL,
                imageURL = NSURL(string: imageURLString) {
                    speaker2ImageView.hnk_setImageFromURL(imageURL, placeholder: qaSession.speakers[1].image) { image in
                        self.speaker2ImageView.image = Toucan(image: image).maskWithEllipse().image
                    }
            } else {
                speaker2ImageView.image = qaSession.speakers[1].image
            }
        }
        
        if qaSession.speakers.count >= 3 {
            if let
                imageURLString = qaSession.speakers[2].imageURL,
                imageURL = NSURL(string: imageURLString) {
                    speaker3ImageView.hnk_setImageFromURL(imageURL, placeholder: qaSession.speakers[2].image) { image in
                        self.speaker3ImageView.image = Toucan(image: image).maskWithEllipse().image
                    }
            } else {
                speaker3ImageView.image = qaSession.speakers[2].image
            }
        }
    }
    
}
