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
    private lazy var needsToScrollToCurrentSession = Calendar.current.isDateInToday(conferenceDay.date)

    var conferenceDay: ConferenceDay
    weak var scheduleViewController: ScheduleViewController?

    fileprivate let sessionDetailsSegue = "sessionDetailsSegue"
    fileprivate var didShowDetail = false

    init(conferenceDay: ConferenceDay, scheduleViewController: ScheduleViewController) {
        self.conferenceDay = conferenceDay
        self.scheduleViewController = scheduleViewController
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        if needsToScrollToCurrentSession {
            needsToScrollToCurrentSession = false
            scrollToCurrentSession(animated: false)
        }

        guard
            let firstSelectableSession = conferenceDay.sessionBlocks
                .flatMap({ $0.sessions })
                .filter({ SessionViewModel(session: $0).selectable }).first,
            let firstSelectableSessionVC = viewController(for: firstSelectableSession),
            let isCollapsed = splitViewController?.isCollapsed,
            !isCollapsed,
            !didShowDetail else { return }
        
        didShowDetail = true
        scheduleViewController?.performSegue(withIdentifier: sessionDetailsSegue, sender: firstSelectableSessionVC)
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
        let sessionDateFormatter = DateFormatter.sessionDateFormatter
        let startString = sessionDateFormatter.string(from: session.startTime)
        let endString = sessionDateFormatter.string(from: session.endTime)
        return "\(startString) - \(endString)"
    }
}

// MARK: - Table view delegate
extension SessionsTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let session = conferenceDay.sessionBlocks[indexPath.section].sessions[indexPath.row]
        guard let viewController = viewController(for: session) else { return }
        scheduleViewController?.performSegue(withIdentifier: sessionDetailsSegue, sender: viewController)
    }
}

extension SessionsTableViewController: IndicatorInfoProvider {
    public func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: DateFormatter.dayDateFormatter.string(from: conferenceDay.date))
    }
}

extension SessionsTableViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
        // This will show the cell clearly and blur the rest of the screen for our peek.
        previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
        let session = conferenceDay.sessionBlocks[indexPath.section].sessions[indexPath.row]
        return viewController(for: session)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        scheduleViewController?.performSegue(withIdentifier: sessionDetailsSegue, sender: viewControllerToCommit)
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
    
    func viewController(for session: Session) -> UIViewController? {
        switch session.type {
        case .talk, .lightningTalk:
            if let presentation = session.presentation {
                return sessionDetails(presentation, session: session)
            }
        case .officeHours:
            if let speaker = session.presentation?.speaker {
                return officeHourDetails(speaker, session: session)
            }
        case .workshop:
            if let presentation = session.presentation, let venue = session.venue {
                return workshopDetails(presentation, session: session, venue: venue)
            }
            else if let presentation = session.presentation {
                return sessionDetails(presentation, session: session)
            }
            else if let event = session.event {
                return webDisplay(event)
            }
        case .meetup:
            if let event = session.event {
                return webDisplay(event)
            }
        case .coffeeBreak:
            if let sponsor = session.sponsor {
                return webDisplay(sponsor)
            }
        case .sponsoredDemo:
            if let sponsor = session.sponsor {
                return webDisplay(sponsor)
            }
        case .party:
            if let venue = session.venue {
                return venueDetails(venue)
            }
        default:
            return nil
        }
        
        return nil
    }
    
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
        let venueDetailsVC = VenueTableViewController(venue: venue)
        venueDetailsVC.tableView.contentInset = UIEdgeInsets(top: 80,left: 0,bottom: 0,right: 0)

        return venueDetailsVC
    }
    func workshopDetails(_ presentation: Presentation, session: Session, venue: Venue) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let workshopDetailVC = storyboard.instantiateViewController(withIdentifier: String(describing: WorkshopDetailViewController.self)) as! WorkshopDetailViewController
        workshopDetailVC.session = session
        workshopDetailVC.presentation = presentation
        workshopDetailVC.venue = venue
        return workshopDetailVC
    }
}

extension SessionsTableViewController {
    
    func scrollToCurrentSession(animated: Bool) {
        let secondsFromGMT = TimeZone.current.secondsFromGMT()
        guard
            let date = Date().changed(second: secondsFromGMT),
            let section = conferenceDay.sessionBlocks.index(where: { date < $0.endTime }),
            !conferenceDay.sessionBlocks[section].sessions.isEmpty
            else { return }
        
        tableView.scrollToRow(at: IndexPath(row: 0, section: section), at: .top, animated: animated)
    }
}
