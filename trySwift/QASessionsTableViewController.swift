//
//  QASessionsTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class QASessionsTableViewController: UITableViewController {

    var dataSource: QASessionDataSourceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(QASessionTableViewCell), bundle: nil), forCellReuseIdentifier: String(QASessionTableViewCell))
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if traitCollection.forceTouchCapability == .Available {
            registerForPreviewingWithDelegate(self, sourceView: tableView)
        }

    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.qaSessions.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(QASessionTableViewCell), forIndexPath: indexPath) as! QASessionTableViewCell
        
        let qaSession = dataSource.qaSessions[indexPath.section]
        cell.configure(withQASession: qaSession)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let session = dataSource.qaSessions[section]
        return "\(session.startTime.stringFromFormat("H:mm")) - \(session.endTime.stringFromFormat("H:mm"))"
    }

}

extension QASessionsTableViewController: IndicatorInfoProvider {
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: dataSource.header)
    }
}

// MARK: Force Touch on Speaker Images
extension QASessionsTableViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRowAtPoint(location) {

            let cell = tableView.cellForRowAtIndexPath(indexPath) as! QASessionTableViewCell
            
            let viewsTo3DTouch = [cell.speaker1ImageView, cell.speaker2ImageView, cell.speaker3ImageView]
            for (index, view) in viewsTo3DTouch.enumerate() where touchedView(view, location: location) {
                
                //This will show the image clearly and blur the rest of the screen for our peek.
                // have to convert the image view coordinates to table view coordinate space
                let viewRectInTableView = tableView.convertRect(view.frame, fromCoordinateSpace: view.superview!)
                previewingContext.sourceRect = viewRectInTableView
                
                // configuring the view controller to show
                let qaSession = dataSource.qaSessions[indexPath.section]
                let speaker = qaSession.speakers[index]
                return viewControllerForSpeaker(speaker)
            }
        }
        return nil
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    private func touchedView(view: UIView, location: CGPoint) -> Bool {
        let locationInView = view.convertPoint(location, fromView: tableView)
        return CGRectContainsPoint(view.bounds, locationInView)
    }
    
    private func viewControllerForSpeaker(speaker: Speaker) -> UIViewController {
        let speakerDetailVC = SpeakerDetailViewController()
        speakerDetailVC.speaker = speaker
        return speakerDetailVC
    }

}
