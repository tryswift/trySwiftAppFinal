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
        
        networkNameLabel.textColor = .trySwiftAccentColor
        passwordLabel.textColor = .trySwiftMainColor
    }

    func configure(withNetworkName networkName: String?, username: String?, password: String?) {
        let ssid = networkName ?? "N/A"
        networkNameLabel.text = "Wi-Fi: \(ssid)"
        
        if let usernameValue = username {
            usernameLabel.text = "Username: \(usernameValue)"
        }
        else {
            usernameLabel.text = nil
        }
        
        if let passwordValue = password {
            passwordLabel.text = "Password: \(passwordValue)"
        }
        else {
            passwordLabel.text = nil
        }

        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
    
}
