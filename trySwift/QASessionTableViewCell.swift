//
//  QASessionTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

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

        speaker1ImageView.image = (qaSession.speakers.count >= 1) ? qaSession.speakers[0].image : nil
        speaker2ImageView.image = (qaSession.speakers.count >= 2) ? qaSession.speakers[1].image : nil
        speaker3ImageView.image = (qaSession.speakers.count >= 3) ? qaSession.speakers[2].image : nil
    }
    
}
