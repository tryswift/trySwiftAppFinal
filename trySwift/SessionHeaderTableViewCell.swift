//
//  PresentationHeaderTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class SessionHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sessionTitleLabel: UILabel!
    @IBOutlet weak var sessionTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sessionTitleLabel.textColor = .trySwiftTitleColor()
        sessionTimeLabel.textColor = .trySwiftSubtitleColor()
    }
    
    func configure(withSession session: Session) {
        sessionTitleLabel.text = session.formattedTitle
        //sessionTimeLabel.text = session.dateTimeString
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
