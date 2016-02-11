//
//  TextTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!

    func configure(withText text: String) {
        textView.text = text
        
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
    
}
