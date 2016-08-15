//
//  SessionDetailsViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class SessionDetailsViewController: UITableViewController {
    
    var session: Session!
    var speaker: Speaker!
    
    private enum SessionDetail: Int {
        case Header, SpeakerInfo, Summary, Twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title = session.description
        
        tableView.registerNib(UINib(nibName: String(SessionHeaderTableViewCell), bundle: nil), forCellReuseIdentifier: String(SessionHeaderTableViewCell))
        tableView.registerNib(UINib(nibName: String(SpeakerTableViewCell), bundle: nil), forCellReuseIdentifier: String(SpeakerTableViewCell))
        tableView.registerNib(UINib(nibName: String(TextTableViewCell), bundle: nil), forCellReuseIdentifier: String(TextTableViewCell))
        tableView.registerNib(UINib(nibName: String(TwitterFollowTableViewCell), bundle: nil), forCellReuseIdentifier: String(TwitterFollowTableViewCell))
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .None
    }
}
    
// MARK: - Table view data source
extension SessionDetailsViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch SessionDetail(rawValue: indexPath.row)! {
        case .Header:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(SessionHeaderTableViewCell), forIndexPath: indexPath) as! SessionHeaderTableViewCell
            cell.configure(withSession: session)
            return cell
        case .SpeakerInfo:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(SpeakerTableViewCell), forIndexPath: indexPath) as! SpeakerTableViewCell
            cell.configure(withSpeaker: speaker, selectionEnabled: false, accessoryEnabled: false)
            return cell
        case .Summary:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TextTableViewCell), forIndexPath: indexPath) as! TextTableViewCell
            cell.configure(withText: "SUMMARY" ?? "TBD")
            return cell
        case .Twitter:
            let cell = tableView.dequeueReusableCellWithIdentifier(String(TwitterFollowTableViewCell), forIndexPath: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: speaker.twitter, delegate: self)
            return cell
        }
    }
}
