//
//  SponsorsViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class SponsorsViewController: UITableViewController {

    /* An array of `Result` objects representing each sponsor level */
    let sponsors = Sponsor.all

    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "Sponsors".localized()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SponsorTableViewCell.self)
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if let firstSponsor = sponsors.first?.first {
            splitViewDetailNavigationViewController?.viewControllers = [webViewController(for: firstSponsor)]
        }
    }
}

// MARK: - Table view data source
extension SponsorsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sponsors.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sponsorLevel = sponsors[section]
        return sponsorLevel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SponsorTableViewCell
        
        let sponsor = sponsors[indexPath.section][indexPath.row]
        cell.configure(withSponsor: sponsor)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let firstSponsor = sponsors[section].first!
        return Sponsor.localizedName(for: firstSponsor.level)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sponsor = sponsors[indexPath.section][indexPath.row]
        let webVC = webViewController(for: sponsor)
        
        splitViewDetailNavigationViewController?.viewControllers = [webVC]
    }
}

private extension SponsorsViewController {
    
    func webViewController(for sponsor: Sponsor) -> WebDisplayViewController {
        let webViewController = WebDisplayViewController()
        webViewController.url = URL(string: sponsor.url!)!
        webViewController.displayTitle = sponsor.name
        
        return webViewController
    }
}
