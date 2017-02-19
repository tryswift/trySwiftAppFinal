//
//  SessionTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Kingfisher
import TrySwiftData

class SessionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sessionTitleLabel: UILabel!
    @IBOutlet weak var sessionImageView: UIImageView!
    @IBOutlet weak var sessionSubtitleLabel: UILabel!
    @IBOutlet weak var sessionTypeLabel: UILabel!
    @IBOutlet weak var sessionLocationLabel: UILabel!

    private lazy var defaultLocation: String = {
        return Conference.current.name!
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        sessionTitleLabel.textColor = .trySwiftTitleColor()
        sessionTypeLabel.textColor = .trySwiftTitleColor()
        sessionSubtitleLabel.textColor = .trySwiftSubtitleColor()
        sessionLocationLabel.textColor = .trySwiftSubtitleColor()
        sessionTitleLabel.clipsToBounds = false
    }
    
    func configure(withSession session: Session) {
        sessionTitleLabel.text = session.formattedTitle ?? defaultLocation
        sessionSubtitleLabel.text = session.formattedSubtitle ?? defaultLocation
        sessionTypeLabel.text = session.sessionDescription
        sessionLocationLabel.text = session.formattedLocation

        let scale = UIScreen.main.scale
        let processor = RoundCornerImageProcessor(cornerRadius: 34, targetSize: CGSize(width: 67, height: 67))
        sessionImageView.kf.setImage(with: session.logoURL, placeholder: nil, options: [.processor(processor), .scaleFactor(scale)])
    
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
