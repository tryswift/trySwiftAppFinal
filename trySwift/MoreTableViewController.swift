//
//  MoreTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {
    
    fileprivate let cellIdentifier = "BasicCell"
    
    fileprivate enum MoreSection: Int {
        case eventDetails, acknowledgements
    }
    
    fileprivate enum EventDetailsRow: Int {
        case about, venue, codeOfConduct
    }
    
    fileprivate enum AcknowledgementsRow: Int {
        case organizers, libraries
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "More"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

// MARK: - Table view data source
extension MoreTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch MoreSection(rawValue: section)! {
        case .eventDetails:
            return 3
        case .acknowledgements:
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        switch MoreSection(rawValue: (indexPath as NSIndexPath).section)! {
        case .eventDetails:
            switch EventDetailsRow(rawValue: (indexPath as NSIndexPath).row)! {
            case .about:
                cell.textLabel?.text = "About"
            case .venue:
                cell.textLabel?.text = "Venue"
            case .codeOfConduct:
                cell.textLabel?.text = "Code of Conduct"
            }
        case .acknowledgements:
            switch AcknowledgementsRow(rawValue: (indexPath as NSIndexPath).row)! {
            case .organizers:
                cell.textLabel?.text = "Organizer"
            case .libraries:
                cell.textLabel?.text = "Acknowledgements"
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch MoreSection(rawValue: (indexPath as NSIndexPath).section)! {
        case .eventDetails:
            switch EventDetailsRow(rawValue: (indexPath as NSIndexPath).row)! {
            case .about:
                showAbout()
            case .venue:
                showVenue()
            case .codeOfConduct:
                showCodeOfConduct()
            }
        case .acknowledgements:
            switch AcknowledgementsRow(rawValue: (indexPath as NSIndexPath).row)! {
            case .organizers:
                showOrganizers()
            case .libraries:
                showLibraries()
            }
        }
        
    }
}

private extension MoreTableViewController {
    
    func showAbout() {
        let aboutViewController = AboutTableViewController()
        navigationController?.pushViewController(aboutViewController, animated: true)
    }
    
    func showVenue() {
        let venueController = VenueTableViewController()
        venueController.venue = Venue.axa
        navigationController?.pushViewController(venueController, animated: true)
    }
    
    func showCodeOfConduct() {
        let webViewController = WebDisplayViewController()
        webViewController.url = URL(string: "https://github.com/NatashaTheRobot/trySwiftCodeOfConduct/blob/master/README.md")!
        webViewController.displayTitle = "Code of Conduct"
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
    func showOrganizers() {
        // only one organizer for this conference, so just shows details
        let organizerViewController = OrganizerDetailTableViewController()
        organizerViewController.organizer = Organizer.organizers.first!
        navigationController?.pushViewController(organizerViewController, animated: true)
    }
    
    func showLibraries() {
        let path = Bundle.main.path(forResource: "Pods-trySwift-acknowledgements", ofType: "plist")
        guard let acknowledgementesViewController = VTAcknowledgementsViewController(path: path) else { return }
        if #available(iOS 9.2, *) {
            acknowledgementesViewController.headerText = "We 🤗 Open Source Software"
        } else {
            acknowledgementesViewController.headerText = "We ❤️ Open Source Software"
        }
        
        navigationController?.pushViewController(acknowledgementesViewController, animated: true)
    }
}
