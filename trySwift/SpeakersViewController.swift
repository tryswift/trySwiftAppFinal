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
    
    fileprivate let speakers = Speaker.speakers
    fileprivate let speakerDetailSegue = "speakerDetailSegue"
    
    var token: NotificationToken?
    
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
        
        tableView.register(UINib(nibName: String(describing: SpeakerTableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: SpeakerTableViewCell))
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let speakerDetailVC = segue.destination as? SpeakerDetailViewController,
            let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        
        speakerDetailVC.speaker = speakers[selectedIndexPath.row]
    }
}

// MARK: - Table view data source
extension SpeakersViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpeakerTableViewCell), for: indexPath) as! SpeakerTableViewCell
        
        cell.configure(withSpeaker: speakers[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: speakerDetailSegue, sender: self)
    }
}

extension SpeakersViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
        //This will show the cell clearly and blur the rest of the screen for our peek.
        previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
        let speakerDetailVC = SpeakerDetailViewController()
        speakerDetailVC.speaker = speakers[indexPath.row]
        return speakerDetailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

extension SpeakersViewController {
    
    func subscribeToChangeNotification() {
        token = speakers.addNotificationBlock { [weak self] changes in
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
