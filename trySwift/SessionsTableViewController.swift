//
//  SessionsTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import RealmSwift
import TrySwiftData

class SessionsTableViewController: UITableViewController {
    
    var dataSource: SessionDataSourceProtocol!
    fileprivate let sessionDetailsSegue = "sessionDetailsSegue"
    
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeToChangeNotification()
        configureTableView()
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: tableView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    deinit {
        token?.stop()
    }
}

// MARK: - Table view data source
extension SessionsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.sessions.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.sessions[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SessionTableViewCell
        
        let session = dataSource.sessions[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        cell.configure(withSession: session)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let session = dataSource.sessions[section].first
        return session?.timeString
    }
}

// MARK: - Table view delegate
extension SessionsTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let session = dataSource.sessions[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        switch session.info {
        case .talk(let presentation):
            let sessionDetailsVC = sessionDetails(presentation, session: session)
            navigationController?.pushViewController(sessionDetailsVC, animated: true)
        case .officeHours(let presentation):
            let officeHoursDetailVC = officeHourDetails(presentation.speaker!, session: session)
            navigationController?.pushViewController(officeHoursDetailVC, animated: true)
        case .workshop(let event):
            let webDisplayVC = webDisplay(event)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .meetup(let event):
            let webDisplayVC = webDisplay(event)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .coffeeBreak(let sponsor):
            guard let sponsor = sponsor else { break }
            let webDisplayVC = webDisplay(sponsor)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .sponsoredDemo(let sponsor):
            let webDisplayVC = webDisplay(sponsor)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .party(let venue):
            let venueVC = venueDetails(venue)
            navigationController?.pushViewController(venueVC, animated: true)
        default:
            break
        }
    }
}

extension SessionsTableViewController: IndicatorInfoProvider {
    public func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: dataSource.header)
    }
}

extension SessionsTableViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
        // This will show the cell clearly and blur the rest of the screen for our peek.
        previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
        let session = dataSource.sessions[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        switch session.info {
        case .talk(let presentation):
            return sessionDetails(presentation, session: session)
        case .officeHours(let presentation):
            return officeHourDetails(presentation.speaker!, session: session)
        case .workshop(let event):
            return webDisplay(event)
        case .meetup(let event):
            return webDisplay(event)
        case .coffeeBreak(let sponsor):
            guard let sponsor = sponsor else { return nil }
            return webDisplay(sponsor)
        case .sponsoredDemo(let sponsor):
            return webDisplay(sponsor)
        case .party(let venue):
            return venueDetails(venue)
        default:
            return nil
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

extension SessionsTableViewController {
    
    func configureTableView() {
        
        tableView.register(SessionTableViewCell.self)
        
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension SessionsTableViewController {
    
    func subscribeToChangeNotification() {
        token = Presentation.presentations.addNotificationBlock { [weak self] changes in
            guard let tableView = self?.tableView else { return }
            
            switch changes {
            case .update(_, _, _, _):
                tableView.reloadData()
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            default:
                break
            }
        }
    }
}

private extension SessionsTableViewController {
    
    func sessionDetails(_ presentation: Presentation, session: Session) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sessionDetailsVC = storyboard.instantiateViewController(withIdentifier: String(describing: SessionDetailsViewController.self)) as! SessionDetailsViewController
        sessionDetailsVC.session = session
        sessionDetailsVC.presentation = presentation
        return sessionDetailsVC
    }
    
    func officeHourDetails(_ speaker: Speaker, session: Session) -> UIViewController {
        let officeHoursVC = OfficeHoursDetailViewController()
        officeHoursVC.speaker = speaker
        officeHoursVC.session = session
        return officeHoursVC
    }
    
    func webDisplay(_ event: Event) -> UIViewController {
        let webViewController = WebDisplayViewController()
        webViewController.url = event.website
        webViewController.displayTitle = event.title
        return webViewController
    }
    
    func webDisplay(_ sponsor: Sponsor) -> UIViewController {
        let webViewController = WebDisplayViewController()
        webViewController.url = URL(string: sponsor.url)
        webViewController.displayTitle = sponsor.name
        return webViewController
    }
    
    func venueDetails(_ venue: Venue) -> UIViewController {
        let venueDetailsVC = VenueTableViewController()
        venueDetailsVC.venue = venue
        return venueDetailsVC
    }
}
