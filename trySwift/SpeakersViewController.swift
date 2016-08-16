//
//  SpeakersViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import RealmSwift

class SpeakersViewController: UITableViewController {
    
    private let speakers = Speaker.speakers
    private let speakerDetailSegue = "speakerDetailSegue"
    
    var token: NotificationToken? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "Speakers"
        subscribeToChangeNotification()
    }

    deinit {
        token?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(SpeakerTableViewCell), bundle: nil), forCellReuseIdentifier: String(SpeakerTableViewCell))
        tableView.estimatedRowHeight = 83
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let speakerDetailVC = segue.destinationViewController as? SpeakerDetailViewController {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                speakerDetailVC.speaker = speakers[selectedIndexPath.row]
            }
        }
    }
}

// MARK: - Table view data source
extension SpeakersViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(SpeakerTableViewCell), forIndexPath: indexPath) as! SpeakerTableViewCell
        
        cell.configure(withSpeaker: speakers[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(speakerDetailSegue, sender: self)
    }
}

extension SpeakersViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRowAtPoint(location) {
            //This will show the cell clearly and blur the rest of the screen for our peek.
            previewingContext.sourceRect = tableView.rectForRowAtIndexPath(indexPath)
            let speakerDetailVC = SpeakerDetailViewController()
            speakerDetailVC.speaker = speakers[indexPath.row]
            return speakerDetailVC
        }
        return nil
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

extension SpeakersViewController {
    
    func subscribeToChangeNotification() {
        token = speakers.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .Initial:
                // Results are now populated and can be accessed without blocking the UI
                tableView.reloadData()
            case .Update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                tableView.beginUpdates()
                tableView.insertRowsAtIndexPaths(insertions.map { NSIndexPath(forRow: $0, inSection: 0) },
                    withRowAnimation: .Automatic)
                tableView.deleteRowsAtIndexPaths(deletions.map { NSIndexPath(forRow: $0, inSection: 0) },
                    withRowAnimation: .Automatic)
                tableView.reloadRowsAtIndexPaths(modifications.map { NSIndexPath(forRow: $0, inSection: 0) },
                    withRowAnimation: .Automatic)
                tableView.endUpdates()
            case .Error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }
    }
}
