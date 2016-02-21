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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = isJapanese ? "その他" : "More"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                cell.textLabel?.text = isJapanese ? "try! Conferenceについて" : "About"
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
                showAbout()
            case .Venue:
                showVenue()
            case .CodeOfConduct:
                showCodeOfConduct()
            }
        case .Acknowledgements:
            switch AcknowledgementsRow(rawValue: indexPath.row)! {
            case .Organizers:
                showOrganizers()
            case .Libraries:
                showLibraries()
            }
        }

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

private extension MoreTableViewController {
    
    func showAbout() {
        let aboutViewController = AboutTableViewController()
        navigationController?.pushViewController(aboutViewController, animated: true)
    }
    
    func showVenue() {
        let webViewController = WebDisplayViewController()
        let instructionsURL = isJapanese ? "http://frontrend.github.io/blog/shibuya-markcity/" : "https://gist.github.com/cjwirth/f462cce018171ddc0c79"
        webViewController.url = NSURL(string: instructionsURL)!
        webViewController.displayTitle = isJapanese ? "会場" : "Venue"
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
    func showCodeOfConduct() {
        let webViewController = WebDisplayViewController()
        webViewController.url = NSURL(string: "https://github.com/NatashaTheRobot/trySwiftCodeOfConduct/blob/master/README.md")!
        webViewController.displayTitle = isJapanese ? "行動規範" : "Code of Conduct"
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
    func showOrganizers() {
        let organizersViewController = OrganizersTableViewController()
        navigationController?.pushViewController(organizersViewController, animated: true)
    }
    
    func showLibraries() {
        if let acknowledgementesViewController = VTAcknowledgementsViewController.acknowledgementsViewController() {
            if #available(iOS 9.2, *) {
               acknowledgementesViewController.headerText = "We 🤗 Open Source Software"
            } else {
                acknowledgementesViewController.headerText = "We ❤️ Open Source Software"
            }

            navigationController?.pushViewController(acknowledgementesViewController, animated: true)
        }
    }
}
