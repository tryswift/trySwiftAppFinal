//
//  AboutTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {

    fileprivate let trySwift = Conference.trySwift
    
    fileprivate enum AboutInfo: Int {
        case header, detail, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "About"
        
        tableView.register(UINib(nibName: String(describing: OrganizerTableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: OrganizerTableViewCell))
        tableView.register(UINib(nibName: String(describing: TextTableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: TextTableViewCell))
        tableView.register(UINib(nibName: String(describing: TwitterFollowTableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: TwitterFollowTableViewCell))
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}

// MARK: - Table view data source
extension AboutTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch AboutInfo(rawValue: (indexPath as NSIndexPath).row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OrganizerTableViewCell), for: indexPath) as! OrganizerTableViewCell
            cell.configure(withConference: trySwift)
            cell.selectionStyle = .none
            cell.accessoryType = .none
            return cell
        case .detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextTableViewCell), for: indexPath) as! TextTableViewCell
            cell.configure(withText: trySwift.description)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterFollowTableViewCell), for: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: trySwift.twitter, delegate: self)
            return cell
        }
    }
    
}
