//
//  SessionsTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import TrySwiftData

class SessionsTableViewController: UITableViewController {
    
    var conferenceDay: ConferenceDay
    lazy var sessionDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "**Session.Time**".localized()
        return dateFormatter
    }()

    lazy var dayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "**Conference.Date**".localized()
        return dateFormatter
    }()

    fileprivate let sessionDetailsSegue = "sessionDetailsSegue"

    init(conferenceDay: ConferenceDay) {
        self.conferenceDay = conferenceDay
        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
}

// MARK: - Table view data source
extension SessionsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return conferenceDay.sessionBlocks.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conferenceDay.sessionBlocks[section].sessions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SessionTableViewCell
        
        let session = conferenceDay.sessionBlocks[indexPath.section].sessions[indexPath.row]
        cell.configure(withSession: session)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let session = conferenceDay.sessionBlocks[section]
        let startString = sessionDateFormatter.string(from: session.startTime)
        let endString = sessionDateFormatter.string(from: session.endTime)
        return "\(startString) - \(endString)"
    }
}

// MARK: - Table view delegate
extension SessionsTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let session = conferenceDay.sessionBlocks[indexPath.section].sessions[indexPath.row]
        switch session.type {
        case .talk:
            let sessionDetailsVC = sessionDetails(session.presentation!, session: session)
            navigationController?.pushViewController(sessionDetailsVC, animated: true)
        case .officeHours:
            let officeHoursDetailVC = officeHourDetails(session.presentation!.speaker!, session: session)
            navigationController?.pushViewController(officeHoursDetailVC, animated: true)
        case .workshop:
            let webDisplayVC = webDisplay(session.event!)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .meetup:
            let webDisplayVC = webDisplay(session.event!)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .coffeeBreak:
            guard let sponsor = session.sponsor else { break }
            let webDisplayVC = webDisplay(sponsor)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .sponsoredDemo:
            let webDisplayVC = webDisplay(session.sponsor!)
            navigationController?.pushViewController(webDisplayVC, animated: true)
        case .party:
            let venueVC = venueDetails(session.venue!)
            navigationController?.pushViewController(venueVC, animated: true)
        default:
            break
        }
    }
}

extension SessionsTableViewController: IndicatorInfoProvider {
    public func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: dayDateFormatter.string(from: conferenceDay.date))
    }
}

extension SessionsTableViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
        // This will show the cell clearly and blur the rest of the screen for our peek.
        previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
        let session = conferenceDay.sessionBlocks[indexPath.section].sessions[indexPath.row]
        switch session.type {
        case .talk:
            return sessionDetails(session.presentation!, session: session)
        case .officeHours:
            return officeHourDetails(session.presentation!.speaker!, session: session)
        case .workshop:
            return webDisplay(session.event!)
        case .meetup:
            return webDisplay(session.event!)
        case .coffeeBreak:
            guard let sponsor = session.sponsor else { return nil }
            return webDisplay(sponsor)
        case .sponsoredDemo:
            return webDisplay(session.sponsor!)
        case .party:
            return venueDetails(session.venue!)
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
        webViewController.url = URL(string: event.website!)
        webViewController.displayTitle = event.title
        return webViewController
    }
    
    func webDisplay(_ sponsor: Sponsor) -> UIViewController {
        let webViewController = WebDisplayViewController()
        webViewController.url = URL(string: sponsor.url!)
        webViewController.displayTitle = sponsor.name
        return webViewController
    }
    
    func venueDetails(_ venue: Venue) -> UIViewController {
        let venueDetailsVC = VenueTableViewController()
        venueDetailsVC.venue = venue
        return venueDetailsVC
    }
}
