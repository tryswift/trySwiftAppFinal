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
    fileprivate var forceTouchedOrganizer: Organizer?

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []

        title = "Organizers".localized()
        configureTableView()
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: tableView)
        }
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
        
        cell.configure(withOrganizer: organizers[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let organizer = organizers[indexPath.row]
        let organizerVC = OrganizerDetailTableViewController(organizer: organizer)
        self.navigationController?.pushViewController(organizerVC, animated: true)
    }
}

extension OrganizersTableViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
        //This will show the cell clearly and blur the rest of the screen for our peek.
        previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
        let organizer = organizers[indexPath.row]
        forceTouchedOrganizer = organizer
        return OrganizerDetailTableViewController(organizer: organizer)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

fileprivate extension OrganizersTableViewController {
    
    func configureTableView() {
        tableView.register(OrganizerTableViewCell.self)
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableView.automaticDimension
    }
}
