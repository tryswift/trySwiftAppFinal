//
//  MoreTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import AcknowList
import TrySwiftData

class MoreTableViewController: UITableViewController {
    
    fileprivate let cellIdentifier = "BasicCell"
    fileprivate let moreDetailSegue = "moreDetailSegue"
    fileprivate var didShowDetail = false
    fileprivate let conference = Conference.current

    fileprivate enum MoreSection: Int {
        case eventDetails, acknowledgements, feedback, slack
    }
    
    fileprivate enum EventDetailsRow: Int {
        case about, venue, codeOfConduct
    }
    
    fileprivate enum AcknowledgementsRow: Int {
        case organizers, libraries
    }
    
    fileprivate enum FeedbackRow: Int {
        case app, conference
    }
    
    fileprivate enum SlackRow: Int {
        case open
    }
    
    
    
    lazy var webViewController: WebDisplayViewController = {
        let webViewController = WebDisplayViewController()
        webViewController.url = URL(string: conference.codeOfConductURL)!
        webViewController.displayTitle = "Code of Conduct".localized()
        return webViewController
    }()
    
    
    lazy var acknowledgement: AcknowListViewController = {
        let path = Bundle.main.path(forResource: "Pods-trySwift-acknowledgements", ofType: "plist")
        let vc = AcknowListViewController(acknowledgementsPlistPath: path)
        vc.edgesForExtendedLayout = []
        vc.headerText = "We ❤️ Open Source Software".localized()
        return vc
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "More".localized()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard
            let isCollapsed = splitViewController?.isCollapsed,
            !isCollapsed,
            !didShowDetail else { return }
        
        didShowDetail = true
        navigateTo(AboutTableViewController.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == moreDetailSegue,
            let navigationVC = segue.destination as? UINavigationController,
            let vc = sender as? UIViewController else { return }
        navigationVC.pushViewController(vc, animated: true)
    }
}

// MARK: - Table view data source
extension MoreTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch MoreSection(rawValue: section)! {
        case .eventDetails:
            return 3
        case .acknowledgements:
            return 2
        case .feedback:
            return 2
        case .slack:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        switch MoreSection(rawValue: indexPath.section)! {
        case .eventDetails:
            switch EventDetailsRow(rawValue: indexPath.row)! {
            case .about:
                cell.textLabel?.text = "About".localized()
            case .venue:
                cell.textLabel?.text = "Venues".localized()
            case .codeOfConduct:
                cell.textLabel?.text = "Code of Conduct".localized()
            }
        case .acknowledgements:
            switch AcknowledgementsRow(rawValue: indexPath.row)! {
            case .organizers:
                cell.textLabel?.text = "Organizers".localized()
            case .libraries:
                cell.textLabel?.text = "Acknowledgements".localized()
            }
        case .feedback:
            switch FeedbackRow(rawValue: indexPath.row)! {
            case .app:
                cell.textLabel?.text = "App Feedback".localized()
            case .conference:
                cell.textLabel?.text = "Conference Feedback".localized()
            }
        case .slack:
            switch SlackRow(rawValue: indexPath.row)! {
            case .open:
                cell.textLabel?.text = "Open Slack".localized()
            }
        }
        
        return cell
    }
    
  
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch MoreSection(rawValue: indexPath.section)! {
        case .eventDetails:
            switch EventDetailsRow(rawValue: indexPath.row)! {
            case .about:
                navigateTo(AboutTableViewController.self)
            case .venue:
                navigateTo(VenuesViewController.self)
            case .codeOfConduct:
                navigateTo({webViewController})
            }
        case .acknowledgements:
            switch AcknowledgementsRow(rawValue: indexPath.row)! {
            case .organizers:
                navigateTo(OrganizersTableViewController.self)
            case .libraries:
                navigateTo ({acknowledgement})
            }
        case .feedback:
            switch FeedbackRow(rawValue: indexPath.row)! {
            case .app:
                showAppFeedback()
            case .conference:
                showConferenceFeedback()
            }
        case .slack:
            switch SlackRow(rawValue: indexPath.row)! {
            case .open:
                openSlack()
            }
        }
    }
}

private extension MoreTableViewController {
    
    func navigateTo<T: UIViewController>(_ controller: () -> T, id: String = "moreDetailSegue"){
        performSegue(withIdentifier: id, sender: controller())
    }
  
    func navigateTo<T: UIViewController>(_ withType: T.Type, id: String = "moreDetailSegue"){
        performSegue(withIdentifier: id, sender: T())
    }
    
    func showAppFeedback() {
        let url = URL(string: conference.githubIssuesURL)!
        openSafariViewController(withURL: url)
    }
    
    func showConferenceFeedback() {
        let configuration = MailConfiguration(recipients: [conference.email], subject: "Conference feedback via try! Conference app")
        sendMail(withConfiguration: configuration)
    }
    
    func openSlack() {
        let application = UIApplication.shared
        let appURL = URL(string: "slack://open")!
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            let url = URL(string: conference.slackURL)!
            openSafariViewController(withURL: url)
        }
    }
}
