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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sessionTitleLabel.textColor = .trySwiftTitleColor
    }
    
    func configure(withSession session: Session) {
        let viewModel = SessionViewModel(session: session)
        sessionTitleLabel.text = viewModel.title
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
}
