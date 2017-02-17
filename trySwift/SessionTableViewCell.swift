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
        sessionTitleLabel.text = session.formattedTitle
        sessionSubtitleLabel.text = session.formattedSubtitle
        sessionTypeLabel.text = session.sessionDescription
        sessionLocationLabel.text = session.formattedLocation
        
        sessionImageView.image = Toucan(image: session.logo).maskWithEllipse().image
    
        if session.selectable {
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
