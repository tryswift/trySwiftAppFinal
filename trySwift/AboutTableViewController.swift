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
        
        tableView.register(UINib(nibName: String(describing: OrganizerTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: OrganizerTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TextTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TextTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TwitterFollowTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TwitterFollowTableViewCell.self))
        
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
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OrganizerTableViewCell.self), for: indexPath) as! OrganizerTableViewCell
            cell.configure(withConference: trySwift)
            cell.selectionStyle = .none
            cell.accessoryType = .none
            return cell
        case .detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextTableViewCell.self), for: indexPath) as! TextTableViewCell
            cell.configure(withText: trySwift.description)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterFollowTableViewCell.self), for: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: trySwift.twitter, delegate: self)
            return cell
        }
    }
    
}
