//
//  OfficeHoursDetailViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/24/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class OfficeHoursDetailViewController: UITableViewController {

    var speaker: Speaker!
    var session: Session!
    
    fileprivate enum OfficeHoursDetail: Int {
        case header, speakerInfo, bio, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Q&A"
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
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SessionHeaderTableViewCell.self), for: indexPath) as! SessionHeaderTableViewCell
            cell.configure(withSession: session)
            return cell
        case .speakerInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpeakerTableViewCell.self), for: indexPath) as! SpeakerTableViewCell
            cell.configure(withSpeaker: speaker, selectionEnabled: false, accessoryEnabled: false)
            return cell
        case .bio:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextTableViewCell.self), for: indexPath) as! TextTableViewCell
            cell.configure(withText: speaker.bio)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterFollowTableViewCell.self), for: indexPath) as! TwitterFollowTableViewCell
            cell.configure(withUsername: speaker.twitter, delegate: self)
            return cell
        }
    }
    
}

extension OfficeHoursDetailViewController {
    
    func configureTableView() {
        tableView.register(UINib(nibName: String(describing: SessionHeaderTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SessionHeaderTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: SpeakerTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SpeakerTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TextTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TextTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TwitterFollowTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TwitterFollowTableViewCell.self))
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}

