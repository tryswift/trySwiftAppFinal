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

    func configure(withWifiInfo wifiInfo: WifiInfo) {
        networkNameLabel.text = "Wifi: \(wifiInfo.networkName)"
        
        if let username = wifiInfo.username, let password = wifiInfo.password {
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
