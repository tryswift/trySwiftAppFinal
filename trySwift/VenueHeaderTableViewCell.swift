//
//  VenueHeaderTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/13/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan

class VenueHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var venueImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let venueLogo = UIImage(named: "venue")!
        venueImageView.image = Toucan(image: venueLogo).maskWithEllipse().image
    }
}
