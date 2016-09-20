//
//  SpeakerDetailViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class SpeakerDetailViewController: UITableViewController {

    var speaker: Speaker!
    
    fileprivate enum SpeakerDetail: Int {
        case header, bio, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = speaker.name
        configureTableView()
    }
}

// MARK: - Table view data source
extension SpeakerDetailViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch SpeakerDetail(rawValue: (indexPath as NSIndexPath).row)! {
        case .header:
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

extension SpeakerDetailViewController {
    
    func configureTableView() {
        tableView.register(UINib(nibName: String(describing: SpeakerTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SpeakerTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TextTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TextTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TwitterFollowTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TwitterFollowTableViewCell.self))
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}
