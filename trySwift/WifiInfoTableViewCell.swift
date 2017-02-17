//
//  WifiInfoTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class WifiInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var networkNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        networkNameLabel.textColor = .trySwiftAccentColor()
    }

    func configure(withNetworkName networkName: String, username: String?, password: String?) {
        networkNameLabel.text = "Wifi: \(networkName)"
        
        if let username = username, let password = password {
            usernameLabel.text = "username: \(username)"
            passwordLabel.text = "password: \(password)"
        } else {
            usernameLabel.text = nil
            passwordLabel.text = nil
        }
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
    
}
