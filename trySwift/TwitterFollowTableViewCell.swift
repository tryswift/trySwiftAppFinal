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
    
    fileprivate var username: String?
    fileprivate weak var delegate: TwitterFollowDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followButton.layer.borderWidth = 1.0
        followButton.layer.borderColor = UIColor.trySwiftAccentColor.cgColor
        followButton.tintColor = .trySwiftAccentColor
        followButton.layer.cornerRadius = 3.0
    }
    
    func configure(withUsername username: String, delegate: TwitterFollowDelegate) {
        self.username = username
        self.delegate = delegate
        
        followButton.setTitle("Follow @\(username)", for: UIControlState())
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
    
    @IBAction func onFollowButtonTap(_ sender: AnyObject) {
        if let username = username {
            delegate?.followUser(username)
        }
    }
}
