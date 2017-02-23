//
//  VenuesViewController.swift
//  trySwift
//
//  Created by Tim Oliver on 2/22/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import TrySwiftData

class VenuesViewController: ButtonBarPagerTabStripViewController {

    let venues = Conference.current.venues

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Venues".localized()

        buttonBarView.register(UINib(nibName: "NavTabButtonCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        buttonBarView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        settings.style.selectedBarBackgroundColor = .white
        buttonBarView.selectedBar.backgroundColor = .trySwiftAccentColor()
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var viewControllers = [VenueTableViewController]()

        for venue in venues {
            viewControllers.append(VenueTableViewController(venue: venue))
        }

        return viewControllers
    }
}
