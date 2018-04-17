//
//  UIImage+Downloader.swift
//  trySwift
//
//  Created by abdelrahman mohamed on 4/14/18.
//  Copyright © 2018 NatashaTheRobot. All rights reserved.
//

import Kingfisher

extension UIImageView {
    
    func setImageWith(_ linkString: String?) {
        guard let linkString = linkString,
            let url = URL(string: linkString) else {
            return
        }
        self.kf.setImage(with: url, placeholder: nil)
    }
    
    func setImageWith(url: URL?) {
        guard let url = url else {
                return
        }
        self.kf.setImage(with: url, placeholder: nil)
    }
}
