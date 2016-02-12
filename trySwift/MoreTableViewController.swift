//
//  MoreTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {

    private let cellIdentifier = "BasicCell"
    
    private enum MoreSection: Int {
        case EventDetails, Acknowledgements
    }
    
    private enum EventDetailsRow: Int {
        case About, Venue, CodeOfConduct
    }
    
    private enum AcknowledgementsRow: Int {
        case Organizers, Libraries
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = isJapanese ? "もっと" : "More"
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch MoreSection(rawValue: section)! {
        case .EventDetails:
            return 3
        case .Acknowledgements:
            return 2
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        switch MoreSection(rawValue: indexPath.section)! {
        case .EventDetails:
            switch EventDetailsRow(rawValue: indexPath.row)! {
            case .About:
                cell.textLabel?.text = isJapanese ? "約" : "About"
            case .Venue:
                cell.textLabel?.text = isJapanese ? "会場" : "Venue"
            case .CodeOfConduct:
                cell.textLabel?.text = isJapanese ? "行動規範" : "Code of Conduct"
            }
        case .Acknowledgements:
            switch AcknowledgementsRow(rawValue: indexPath.row)! {
            case .Organizers:
                cell.textLabel?.text = isJapanese ? "主催者" : "Organizers"
            case .Libraries:
                cell.textLabel?.text = isJapanese ? "謝辞" : "Acknowledgements"
            }
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch MoreSection(rawValue: indexPath.section)! {
        case .EventDetails:
            switch EventDetailsRow(rawValue: indexPath.row)! {
            case .About:
                return
            case .Venue:
                return
            case .CodeOfConduct:
                return
            }
        case .Acknowledgements:
            switch AcknowledgementsRow(rawValue: indexPath.row)! {
            case .Organizers:
                showOrganizers()
            case .Libraries:
                showLibraries()
            }
        }

    }
}

private extension MoreTableViewController {
    
    func showOrganizers() {
        let organizersViewController = OrganizersTableViewController()
        navigationController?.pushViewController(organizersViewController, animated: true)
    }
    
    func showLibraries() {
        if let acknowledgementesViewController = VTAcknowledgementsViewController.acknowledgementsViewController() {
            acknowledgementesViewController.headerText = "We 🤗 Open Source Software"
            navigationController?.pushViewController(acknowledgementesViewController, animated: true)
        }
    }
}
