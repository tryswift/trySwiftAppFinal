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
    var presentation: Presentation!
    
    fileprivate enum PresentationDetail: Int {
        case header, speakerInfo, summary, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Presentation"
        configureTableView()
    }
}
    
// MARK: - Table view data source
extension SessionDetailsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch PresentationDetail(rawValue: (indexPath as NSIndexPath).row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SessionHeaderTableViewCell), for: indexPath) as! SessionHeaderTableViewCell
            cell.configure(withSession: session)
            return cell
        case .speakerInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpeakerTableViewCell), for: indexPath) as! SpeakerTableViewCell
            cell.configure(withSpeaker: presentation.speaker!, selectionEnabled: false, accessoryEnabled: false)
            return cell
        case .summary:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextTableViewCell), for: indexPath) as! TextTableViewCell
            cell.configure(withText: presentation.summary ?? "TBD")
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterFollowTableViewCell), for: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: presentation.speaker!.twitter, delegate: self)
            return cell
        }
    }
}

extension SessionDetailsViewController {
    
    func configureTableView() {
        tableView.register(UINib(nibName: String(describing: SessionHeaderTableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: SessionHeaderTableViewCell))
        tableView.register(UINib(nibName: String(describing: SpeakerTableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: SpeakerTableViewCell))
        tableView.register(UINib(nibName: String(describing: TextTableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: TextTableViewCell))
        tableView.register(UINib(nibName: String(describing: TwitterFollowTableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: TwitterFollowTableViewCell))
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}
