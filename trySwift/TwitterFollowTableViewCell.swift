//
//  TwitterFollowTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

protocol TwitterFollowDelegate: class {
    func followUser(username: String)
}

class TwitterFollowTableViewCell: UITableViewCell {

    @IBOutlet weak var followButton: UIButton!
    
    private var username: String?
    private weak var delegate: TwitterFollowDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followButton.layer.borderWidth = 1.0
        followButton.layer.borderColor = UIColor.twitterBlue().CGColor
        followButton.tintColor = UIColor.twitterBlue()
        followButton.layer.cornerRadius = 3.0
    }
    
    func configure(withUsername username: String, delegate: TwitterFollowDelegate) {
        self.username = username
        self.delegate = delegate
        
        followButton.setTitle("Follow @\(username)", forState: .Normal)
    }
    
    @IBAction func onFollowButtonTap(sender: AnyObject) {
        if let username = username {
            delegate?.followUser(username)
        }
    }
}
