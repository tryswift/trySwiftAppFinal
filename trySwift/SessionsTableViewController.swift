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

class SessionsTableViewController: UITableViewController {
    
    var dataSource: SessionDataSourceProtocol!
    private let sessionDetailsSegue = "sessionDetailsSegue"
    
    var token: NotificationToken? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeToChangeNotification()
        configureTableView()
        
        if traitCollection.forceTouchCapability == .Available {
            registerForPreviewingWithDelegate(self, sourceView: tableView)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    deinit {
        token?.stop()
    }
}

// MARK: - Table view data source
extension SessionsTableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.sessions.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.sessions[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(SessionTableViewCell), forIndexPath: indexPath) as! SessionTableViewCell
        
        let session = dataSource.sessions[indexPath.section][indexPath.row]
        cell.configure(withSession: session)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let session = dataSource.sessions[section].first
        return session?.timeString
    }
}

// MARK: - Table view delegate
extension SessionsTableViewController {

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let session = dataSource.sessions[indexPath.section][indexPath.row]
        switch session.info {
        case .Talk(let presentation):
            let sessionDetailsVC = sessionDetails(presentation, session: session)
            navigationController?.pushViewController(sessionDetailsVC, animated: true)
        case .OfficeHours(let presentation):
            let speakerDetailsVC = speakerDetails(presentation.speaker!)
            navigationController?.pushViewController(speakerDetailsVC, animated: true)
        case .Workshop(let event):
            let webDisplayVC = webDisplay(event)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .Meetup(let event):
            let webDisplayVC = webDisplay(event)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .CoffeeBreak(let sponsor):
            if let sponsor = sponsor {
                let webDisplayVC = webDisplay(sponsor)
                navigationController?.pushViewController(webDisplayVC, animated: true)
            }
        case .SponsoredDemo(let sponsor):
            let webDisplayVC = webDisplay(sponsor)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .Party(let venue):
            let venueVC = venueDetails(venue)
            navigationController?.pushViewController(venueVC, animated: true)
        default:
            break
        }
    }
}

extension SessionsTableViewController: IndicatorInfoProvider {
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: dataSource.header)
    }
}

extension SessionsTableViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRowAtPoint(location) {
            // This will show the cell clearly and blur the rest of the screen for our peek.
            previewingContext.sourceRect = tableView.rectForRowAtIndexPath(indexPath)
            let session = dataSource.sessions[indexPath.section][indexPath.row]
            switch session.info {
            case .Talk(let presentation):
                return sessionDetails(presentation, session: session)
            case .OfficeHours(let presentation):
                return speakerDetails(presentation.speaker!)
            case .Workshop(let event):
                return webDisplay(event)
            case .Meetup(let event):
                return webDisplay(event)
            case .CoffeeBreak(let sponsor):
                if let sponsor = sponsor {
                    return webDisplay(sponsor)
                }
                return nil
            case .SponsoredDemo(let sponsor):
                return webDisplay(sponsor)
            case .Party(let venue):
                return venueDetails(venue)
            default:
                break
            }
        }
        return nil
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

extension SessionsTableViewController {
    
    func configureTableView() {
        tableView.registerNib(UINib(nibName: String(SessionTableViewCell), bundle: nil), forCellReuseIdentifier: String(SessionTableViewCell))
        
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension SessionsTableViewController {
    
    func subscribeToChangeNotification() {
        token = Presentation.presentations.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            
            switch changes {
            case .Update(_, _, _, _):
                tableView.reloadData()
            case .Error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            default:
                break
            }
        }
    }
}

private extension SessionsTableViewController {
    
    func sessionDetails(presentation: Presentation, session: Session) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sessionDetailsVC = storyboard.instantiateViewControllerWithIdentifier(String(SessionDetailsViewController)) as! SessionDetailsViewController
        sessionDetailsVC.session = session
        sessionDetailsVC.presentation = presentation
        return sessionDetailsVC
    }
    
    func speakerDetails(speaker: Speaker) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let speakerDetailsVC = storyboard.instantiateViewControllerWithIdentifier(String(SpeakerDetailViewController)) as! SpeakerDetailViewController
        speakerDetailsVC.speaker = speaker
        return speakerDetailsVC
    }
    
    func webDisplay(event: Event) -> UIViewController {
        let webViewController = WebDisplayViewController()
        webViewController.url = event.website
        webViewController.displayTitle = event.title
        return webViewController
    }
    
    func webDisplay(sponsor: Sponsor) -> UIViewController {
        let webViewController = WebDisplayViewController()
        webViewController.url = NSURL(string: sponsor.url)
        webViewController.displayTitle = sponsor.name
        return webViewController
    }
    
    func venueDetails(venue: Venue) -> UIViewController {
        let venueDetailsVC = VenueTableViewController()
        venueDetailsVC.venue = venue
        return venueDetailsVC
    }
}
