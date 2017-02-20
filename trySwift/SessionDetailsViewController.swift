//
//  SessionDetailsViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class SessionDetailsViewController: UITableViewController {
    
    var session: Session!
    var presentation: Presentation!
    
    fileprivate enum PresentationDetail: Int {
        case header, speakerInfo, summary, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Presentation".localized()
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
        switch PresentationDetail(rawValue: indexPath.row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SessionHeaderTableViewCell
            cell.configure(withSession: session)
            return cell
        case .speakerInfo:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SpeakerTableViewCell
            cell.configure(withSpeaker: presentation.speaker!, selectionEnabled: false, accessoryEnabled: false)
            return cell
        case .summary:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TextTableViewCell
            cell.configure(withText: presentation.localizedSummary)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TwitterFollowTableViewCell
            cell.configure(withUsername: presentation.speaker!.twitter, delegate: self)
            return cell
        }
    }
}

extension SessionDetailsViewController {
    
    func configureTableView() {
        tableView.register(SessionHeaderTableViewCell.self)
        tableView.register(SpeakerTableViewCell.self)
        tableView.register(TextTableViewCell.self)
        tableView.register(TwitterFollowTableViewCell.self)
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}
