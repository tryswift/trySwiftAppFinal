//
//  OrganizerDetailTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/13/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class OrganizerDetailTableViewController: UITableViewController {

    var organizer: Organizer!
    
    fileprivate enum OrganizerDetail: Int {
        case header, bio, twitter
    }

    init(organizer: Organizer) {
        super.init(style: .plain)
        self.organizer = organizer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = organizer.name
        
        tableView.register(OrganizerTableViewCell.self)
        tableView.register(TextTableViewCell.self)
        tableView.register(TwitterFollowTableViewCell.self)
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}

// MARK: - Table view data source
extension OrganizerDetailTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch OrganizerDetail(rawValue: (indexPath as NSIndexPath).row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as OrganizerTableViewCell
            cell.configure(withOrganizer: organizer, selectionEnabled: false, accessoryEnabled: false)
            return cell
        case .bio:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TextTableViewCell
            cell.configure(withText: organizer.localizedBio)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TwitterFollowTableViewCell
            cell.configure(withUsername: organizer.twitter, delegate: self)
            return cell
        }
    }
    
}
