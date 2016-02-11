//
//  TwitterFollowTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class TwitterFollowTableViewCell: UITableViewCell {

    @IBOutlet weak var followButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followButton.layer.borderWidth = 1.0
        followButton.layer.borderColor = UIColor.twitterBlue().CGColor
        followButton.setTitleColor(UIColor.twitterBlue(), forState: .Normal)
        followButton.layer.cornerRadius = 3.0
    }
    
    func configure(withUsername username: String) {
        followButton.setTitle("Follow @\(username)", forState: .Normal)
    }

    @IBAction func onFollowButtonTap(sender: AnyObject) {
        
    }
}
