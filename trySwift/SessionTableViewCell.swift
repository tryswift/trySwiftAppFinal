//
//  SessionTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
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
        sessionTitleLabel.textColor = .trySwiftTitleColor
        sessionTypeLabel.textColor = .trySwiftTitleColor
        sessionSubtitleLabel.textColor = .trySwiftSubtitleColor
        sessionLocationLabel.textColor = .trySwiftSubtitleColor
        sessionTitleLabel.clipsToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.image = nil
    }
    
    func configure(withSession session: Session) {
        let viewModel = SessionViewModel(session: session)
        sessionTitleLabel.text = viewModel.title
        sessionSubtitleLabel.text = viewModel.presenter
        sessionTypeLabel.text = viewModel.shortDescription
        sessionLocationLabel.text = viewModel.location

        sessionImageView.setImageWith(url: viewModel.imageURL)
    
        if viewModel.selectable {
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
