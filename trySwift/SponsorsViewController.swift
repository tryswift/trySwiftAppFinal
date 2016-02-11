//
//  SponsorsViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class SponsorsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = isJapanese ? "スポンサー" : "Sponsors"
        
        tableView.registerNib(UINib(nibName: String(SponsorTableViewCell), bundle: nil), forCellReuseIdentifier: String(SponsorTableViewCell))
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Sponsor.Level(rawValue: section)! {
            case .Diamond: return Sponsor.diamondSponsors.count
            case .Gold: return Sponsor.goldSponsors.count
            case .Silver: return Sponsor.silverSponsors.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(SponsorTableViewCell), forIndexPath: indexPath) as! SponsorTableViewCell
        
        switch Sponsor.Level(rawValue: indexPath.section)! {
        case .Diamond:
            let sponsor = Sponsor.diamondSponsors[indexPath.row]
            cell.configure(withSponsor: sponsor)
        case .Gold:
            let sponsor = Sponsor.goldSponsors[indexPath.row]
            cell.configure(withSponsor: sponsor)
        case .Silver:
            let sponsor = Sponsor.silverSponsors[indexPath.row]
            cell.configure(withSponsor: sponsor)
        }

        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sponsorLevel = Sponsor.Level(rawValue: section)!
        return sponsorLevel.title
    }

}
