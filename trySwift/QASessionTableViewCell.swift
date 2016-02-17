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

        speaker1ImageView.image = qaSession.speakers[0].image
        speaker2ImageView.image = qaSession.speakers[1].image
        speaker3ImageView.image = qaSession.speakers[2].image
    }
    
}
