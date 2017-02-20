//
//  OrganizersTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class OrganizersTableViewController: UITableViewController {

    fileprivate let organizers = Conference.current.organizers

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Organizers".localized()
        configureTableView()
    }
}

// MARK: - Table view data source
extension OrganizersTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as OrganizerTableViewCell
        
        cell.configure(withOrganizer: organizers[(indexPath as NSIndexPath).row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let organizer = organizers[(indexPath as NSIndexPath).row]
        let organizerVC = OrganizerDetailTableViewController(organizer: organizer)
        self.navigationController?.pushViewController(organizerVC, animated: true)
    }
}

fileprivate extension OrganizersTableViewController {
    
    func configureTableView() {
        tableView.register(OrganizerTableViewCell.self)
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}
