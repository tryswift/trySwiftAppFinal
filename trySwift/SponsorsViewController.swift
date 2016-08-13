//
//  SponsorsViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class SponsorsViewController: UITableViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "Sponsors"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(SponsorTableViewCell), bundle: nil), forCellReuseIdentifier: String(SponsorTableViewCell))
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
}

// MARK: - Table view data source
extension SponsorsViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sponsor.Level(rawValue: section)! {
        case .Platinum:
            return Sponsor.platinumSponsors.count
        case .Gold:
            return Sponsor.goldSponsors.count
        case .Silver:
            return Sponsor.silverSponsors.count
        case .Diversity:
            return Sponsor.diversitySponsors.count
        case .Student:
            return Sponsor.studentSponsors.count
        case .Event:
            return Sponsor.eventPartners.count
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(SponsorTableViewCell), forIndexPath: indexPath) as! SponsorTableViewCell
        
        let sponsor = sponsorAtIndexPath(indexPath)
        cell.configure(withSponsor: sponsor)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sponsorLevel = Sponsor.Level(rawValue: section)!
        return sponsorLevel.description
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let sponsor = sponsorAtIndexPath(indexPath)
        
        let webViewController = WebDisplayViewController()
        webViewController.url = NSURL(string: sponsor.url)!
        webViewController.displayTitle = sponsor.name
        
        navigationController?.pushViewController(webViewController, animated: true)
    }
}

private extension SponsorsViewController {
    
    func sponsorAtIndexPath(indexPath: NSIndexPath) -> Sponsor {
        switch Sponsor.Level(rawValue: indexPath.section)! {
        case .Platinum:
            return Sponsor.platinumSponsors[indexPath.row]
        case .Gold:
            return Sponsor.goldSponsors[indexPath.row]
        case .Silver:
            return Sponsor.silverSponsors[indexPath.row]
        case .Diversity:
            return Sponsor.diversitySponsors[indexPath.row]
        case .Student:
            return Sponsor.studentSponsors[indexPath.row]
        case .Event:
            return Sponsor.eventPartners[indexPath.row]
        }
    }
}
