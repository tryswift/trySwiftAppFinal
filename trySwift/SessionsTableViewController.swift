//
//  SessionsTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import XLPagerTabStrip 

class SessionsTableViewController: UITableViewController {

    var dataSource: SessionDataSourceProtocol!
    private let sessionDetailsSegue = "sessionDetailsSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(SessionTableViewCell), bundle: nil), forCellReuseIdentifier: String(SessionTableViewCell))
        
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableViewAutomaticDimension
        
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.sessions.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(SessionTableViewCell), forIndexPath: indexPath) as! SessionTableViewCell

        let session = dataSource.sessions[indexPath.section]
        cell.configure(withSession: session)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let session = dataSource.sessions[section]
        return session.timeString
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let session = dataSource.sessions[indexPath.section]
        if let speaker = session.speaker {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sessionDetailsVC = storyboard.instantiateViewControllerWithIdentifier(String(SessionDetailsViewController)) as! SessionDetailsViewController
            sessionDetailsVC.session = session
            sessionDetailsVC.speaker = speaker
            navigationController?.pushViewController(sessionDetailsVC, animated: true)
        }

        if session.id == 319 { // TOMBOY106
            let webViewController = WebDisplayViewController()
            webViewController.url = NSURL(string: "http://www.tomboy106.com/shibuya106/index.html")!
            webViewController.displayTitle = session.location
            navigationController?.pushViewController(webViewController, animated: true)
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
            //This will show the cell clearly and blur the rest of the screen for our peek.
            previewingContext.sourceRect = tableView.rectForRowAtIndexPath(indexPath)
            let session = dataSource.sessions[indexPath.section]
            if let speaker = session.speaker {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let sessionDetailsVC = storyboard.instantiateViewControllerWithIdentifier(String(SessionDetailsViewController)) as! SessionDetailsViewController
                sessionDetailsVC.session = session
                sessionDetailsVC.speaker = speaker
                return sessionDetailsVC
            }
        }
        return nil
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

