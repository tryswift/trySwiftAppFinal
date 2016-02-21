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
        
        title = isJapanese ? "スポンサー" : "Sponsors"
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
        
        let sponsor = sponsorAtIndexPath(indexPath)
        cell.configure(withSponsor: sponsor)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sponsorLevel = Sponsor.Level(rawValue: section)!
        return sponsorLevel.title
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let sponsor = sponsorAtIndexPath(indexPath)
        
        let webViewController = WebDisplayViewController()
        webViewController.url = NSURL(string: "http://\(sponsor.website)")!
        webViewController.displayTitle = sponsor.name
        
        self.navigationController?.pushViewController(webViewController, animated: true)
    }

}

private extension SponsorsViewController {
    
    func sponsorAtIndexPath(indexPath: NSIndexPath) -> Sponsor {

        switch Sponsor.Level(rawValue: indexPath.section)! {
        case .Diamond:
            return Sponsor.diamondSponsors[indexPath.row]
        case .Gold:
            return Sponsor.goldSponsors[indexPath.row]
        case .Silver:
            return Sponsor.silverSponsors[indexPath.row]
        }

    }
}
