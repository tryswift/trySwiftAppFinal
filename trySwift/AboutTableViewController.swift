//
//  AboutTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class AboutTableViewController: UITableViewController {

    fileprivate let trySwift = Conference.current
    
    fileprivate enum AboutInfo: Int {
        case header, detail, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About"
        configureTableView()
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
        switch AboutInfo(rawValue: (indexPath as IndexPath).row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as OrganizerTableViewCell
            cell.configure(withConference: trySwift)
            cell.selectionStyle = .none
            cell.accessoryType = .none
            return cell
        case .detail:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TextTableViewCell
            cell.configure(withText: trySwift.localizedDescription)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TwitterFollowTableViewCell
            cell.configure(withUsername: trySwift.twitter!, delegate: self)
            return cell
        }
    }
}

fileprivate extension AboutTableViewController {
    
    func configureTableView() {
        tableView.register(OrganizerTableViewCell.self)
        tableView.register(TextTableViewCell.self)
        tableView.register(TwitterFollowTableViewCell.self)
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}
