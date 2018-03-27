//
//  SpeakersViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class SpeakersViewController: UITableViewController {
    
    fileprivate let speakers = Speaker.all
    fileprivate let speakerDetailSegue = "speakerDetailSegue"
    fileprivate var didShowDetail = false
    fileprivate var forceTouchedSpeaker: Speaker?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "Speakers".localized()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SpeakerTableViewCell.self)
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: tableView)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard
            let speaker = speakers.first,
            let isCollapsed = splitViewController?.isCollapsed,
            !isCollapsed,
            !didShowDetail else { return }
        
        didShowDetail = true
        performSegue(withIdentifier: speakerDetailSegue, sender: speaker)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == speakerDetailSegue,
            let navigationVC = segue.destination as? UINavigationController,
            let speakerDetailVC = navigationVC.topViewController as? SpeakerDetailViewController else { return }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            speakerDetailVC.speaker = speakers[selectedIndexPath.row]
        } else if let speaker = sender as? Speaker {
            speakerDetailVC.speaker = speaker
        }
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
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SpeakerTableViewCell
        
        cell.configure(withSpeaker: speakers[indexPath.row], delegate: self, speakerImageDelegate: nil)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: speakerDetailSegue, sender: speakers[indexPath.row])
    }
}

extension SpeakersViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
        //This will show the cell clearly and blur the rest of the screen for our peek.
        previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
        let speaker = speakers[indexPath.row]
        forceTouchedSpeaker = speaker
        return speakerDetailViewController(for: speaker)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        performSegue(withIdentifier: speakerDetailSegue, sender: forceTouchedSpeaker)
    }
}

private extension SpeakersViewController {
    
    func speakerDetailViewController(for speaker: Speaker) -> SpeakerDetailViewController {
        let speakerDetailVC = SpeakerDetailViewController()
        speakerDetailVC.speaker = speaker
        return speakerDetailVC
    }
}
