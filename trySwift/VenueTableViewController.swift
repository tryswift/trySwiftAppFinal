//
//  VenueTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/13/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData
import XLPagerTabStrip

class VenueTableViewController: UITableViewController {

    var venue: Venue!

    init(venue: Venue) {
        self.venue = venue
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate enum VenueDetail: Int {
        case header, wifi, address, map, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Venue".localized()
        configureTableView()
    }
}

extension VenueTableViewController: IndicatorInfoProvider {
    public func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: Venue.localizedName(for: venue.type))
    }
}

// MARK: - Table view data source
extension VenueTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch VenueDetail(rawValue: indexPath.row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as VenueHeaderTableViewCell
            cell.configure(withVenue: venue)
            return cell
        case .wifi:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as WifiInfoTableViewCell
            cell.configure(withNetworkName: venue.wifiNetworkName, username: venue.wifiUsername, password: venue.wifiPassword)
            return cell
        case .address:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TextTableViewCell
            cell.configure(withText: venue.address)
            return cell
        case .map:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MapTableViewCell
            cell.configure(withAddress: venue.address)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TwitterFollowTableViewCell
            cell.configure(withUsername: venue.twitter!, delegate: self)
            return cell

        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if case VenueDetail.map = VenueDetail(rawValue: indexPath.row)! {
            return 300
        }
        
        return UITableViewAutomaticDimension
    }
}

private extension VenueTableViewController {
    
    func configureTableView() {
        tableView.register(VenueHeaderTableViewCell.self)
        tableView.register(WifiInfoTableViewCell.self)
        tableView.register(TextTableViewCell.self)
        tableView.register(MapTableViewCell.self)
        tableView.register(TwitterFollowTableViewCell.self)
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}
