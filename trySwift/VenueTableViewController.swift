//
//  VenueTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/13/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class VenueTableViewController: UITableViewController {

    var venue: Venue!
    
    private enum VenueDetail: Int {
        case Header, Address, Map, Twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Venue"
        configureTableView()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch VenueDetail(rawValue: indexPath.row)! {
        case .Header:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(VenueHeaderTableViewCell), forIndexPath: indexPath) as! VenueHeaderTableViewCell
            cell.configure(withVenue: Venue.axa)
            return cell
        case .Address:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TextTableViewCell), forIndexPath: indexPath) as! TextTableViewCell
            cell.configure(withAttributedText: venue.formattedAddress)
            return cell
        case .Map:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(MapTableViewCell), forIndexPath: indexPath) as! MapTableViewCell
            cell.configure(withAddress: venue.address)
            return cell
        case .Twitter:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TwitterFollowTableViewCell), forIndexPath: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: venue.twitter, delegate: self)
            return cell

        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if case VenueDetail.Map = VenueDetail(rawValue: indexPath.row)! {
            return 300
        }
        
        return UITableViewAutomaticDimension
    }
}

private extension VenueTableViewController {
    
    func configureTableView() {
        tableView.registerNib(UINib(nibName: String(VenueHeaderTableViewCell), bundle: nil), forCellReuseIdentifier: String(VenueHeaderTableViewCell))
        tableView.registerNib(UINib(nibName: String(TextTableViewCell), bundle: nil), forCellReuseIdentifier: String(TextTableViewCell))
        tableView.registerNib(UINib(nibName: String(MapTableViewCell), bundle: nil), forCellReuseIdentifier: String(MapTableViewCell))
        tableView.registerNib(UINib(nibName: String(TwitterFollowTableViewCell), bundle: nil), forCellReuseIdentifier: String(TwitterFollowTableViewCell))
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .None
    }
}
