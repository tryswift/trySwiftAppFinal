//
//  SpeakersViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class SpeakersViewController: UITableViewController {

    private let speakers = Speaker.speakers
    private let speakerDetailSegue = "speakerDetailSegue"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = isJapanese ? "講演者" : "Speakers"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(SpeakerTableViewCell), bundle: nil), forCellReuseIdentifier: String(SpeakerTableViewCell))
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let speakerDetailVC = segue.destinationViewController as? SpeakerDetailViewController {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                speakerDetailVC.speaker = speakers[selectedIndexPath.row]
            }
        }
    }

    // MARK: - Table view data source

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
