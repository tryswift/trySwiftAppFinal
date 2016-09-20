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
        
        tableView.register(UINib(nibName: String(describing: SponsorTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SponsorTableViewCell.self))
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

// MARK: - Table view data source
extension SponsorsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sponsor.Level(rawValue: section)! {
        case .platinum:
            return Sponsor.platinumSponsors.count
        case .gold:
            return Sponsor.goldSponsors.count
        case .silver:
            return Sponsor.silverSponsors.count
        case .diversity:
            return Sponsor.diversitySponsors.count
        case .student:
            return Sponsor.studentSponsors.count
        case .event:
            return Sponsor.eventPartners.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SponsorTableViewCell.self), for: indexPath) as! SponsorTableViewCell
        
        let sponsor = sponsorAtIndexPath(indexPath)
        cell.configure(withSponsor: sponsor)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sponsorLevel = Sponsor.Level(rawValue: section)
        return sponsorLevel?.description
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sponsor = sponsorAtIndexPath(indexPath)
        
        let webViewController = WebDisplayViewController()
        webViewController.url = URL(string: sponsor.url)!
        webViewController.displayTitle = sponsor.name
        
        navigationController?.pushViewController(webViewController, animated: true)
    }
}

private extension SponsorsViewController {
    
    func sponsorAtIndexPath(_ indexPath: IndexPath) -> Sponsor {
        switch Sponsor.Level(rawValue: (indexPath as NSIndexPath).section)! {
        case .platinum:
            return Sponsor.platinumSponsors[(indexPath as NSIndexPath).row]
        case .gold:
            return Sponsor.goldSponsors[(indexPath as NSIndexPath).row]
        case .silver:
            return Sponsor.silverSponsors[(indexPath as NSIndexPath).row]
        case .diversity:
            return Sponsor.diversitySponsors[(indexPath as NSIndexPath).row]
        case .student:
            return Sponsor.studentSponsors[(indexPath as NSIndexPath).row]
        case .event:
            return Sponsor.eventPartners[(indexPath as NSIndexPath).row]
        }
    }
}
