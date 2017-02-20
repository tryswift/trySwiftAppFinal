//
//  OfficeHoursDetailViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/24/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class OfficeHoursDetailViewController: UITableViewController {

    var speaker: Speaker!
    var session: Session!
    
    fileprivate enum OfficeHoursDetail: Int {
        case header, speakerInfo, bio, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Q&A".localized()
        configureTableView()
    }

}

// MARK: - Table view data source
extension OfficeHoursDetailViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch OfficeHoursDetail(rawValue: (indexPath as NSIndexPath).row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SessionHeaderTableViewCell
            cell.configure(withSession: session)
            return cell
        case .speakerInfo:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SpeakerTableViewCell
            cell.configure(withSpeaker: speaker, selectionEnabled: false, accessoryEnabled: false)
            return cell
        case .bio:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TextTableViewCell
            cell.configure(withText: speaker.localizedBio)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TwitterFollowTableViewCell
            cell.configure(withUsername: speaker.twitter, delegate: self)
            return cell
        }
    }
    
}

extension OfficeHoursDetailViewController {
    
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

