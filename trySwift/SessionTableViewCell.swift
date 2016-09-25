//
//  SessionTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan
import TrySwiftData

class SessionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sessionTitleLabel: UILabel!
    @IBOutlet weak var sessionImageView: UIImageView!
    @IBOutlet weak var sessionSubtitleLabel: UILabel!
    @IBOutlet weak var sessionTypeLabel: UILabel!
    @IBOutlet weak var sessionLocationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sessionTitleLabel.textColor = .trySwiftTitleColor()
        sessionTypeLabel.textColor = .trySwiftTitleColor()
        sessionSubtitleLabel.textColor = .trySwiftSubtitleColor()
        sessionLocationLabel.textColor = .trySwiftSubtitleColor()
        sessionTitleLabel.clipsToBounds = false
    }
    
    func configure(withSession session: Session) {
        let info = session.info
        
        sessionTitleLabel.text = info.title
        sessionSubtitleLabel.text = info.subtitle
        sessionTypeLabel.text = info.description
        sessionLocationLabel.text = info.location
        
        sessionImageView.image = Toucan(image: info.logo).maskWithEllipse().image
    
        if info.selectable {
            accessoryType = .disclosureIndicator
            selectionStyle = .default
        } else {
            accessoryType = .none
            selectionStyle = .none
        }

        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
