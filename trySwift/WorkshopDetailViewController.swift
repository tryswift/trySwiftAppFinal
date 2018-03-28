//
//  WorkshopViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/14/18.
//  Copyright © 2018 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class WorkshopDetailViewController: UITableViewController {

    var session: Session?
    var presentation: Presentation?
    var venue: Venue?
    
    fileprivate enum WorkshopDetail: Int {
        case header, speakerInfo, summary, twitter, venue, map
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        tableView.contentInset = insets
        edgesForExtendedLayout = []
        
        title = "Workshop".localized()
        configureTableView()
    }
}

// MARK: - Table view data source
extension WorkshopDetailViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _ = session, let _ = presentation else { return 0 }
        
        if venue != nil {
            return 6
        }
        
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let session = session, let presentation = presentation else { fatalError() }
        switch WorkshopDetail(rawValue: indexPath.row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SessionHeaderTableViewCell
            cell.configure(withSession: session)
            return cell
        case .speakerInfo:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SpeakerTableViewCell
            cell.configure(withSpeaker: presentation.speaker!, selectionEnabled: false, accessoryEnabled: false, delegate: self, speakerImageDelegate: self)
            return cell
        case .summary:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TextTableViewCell
            cell.configure(withText: presentation.localizedSummary)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TwitterFollowTableViewCell
            cell.configure(withUsername: presentation.speaker!.twitter, delegate: self)
            return cell
        case .venue:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as VenueHeaderTableViewCell
            if let venue = venue {
                cell.configure(withVenue: venue)
            }
            return cell
        case .map:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MapTableViewCell
            if let venue = venue {
                cell.configure(withAddress: venue.address, delegate: self)
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch WorkshopDetail(rawValue: indexPath.row)! {
        case .map:
            return 300
        default:
            return UITableViewAutomaticDimension
        }
    }
}

extension WorkshopDetailViewController {
    
    func configureTableView() {
        tableView.register(SessionHeaderTableViewCell.self)
        tableView.register(SpeakerTableViewCell.self)
        tableView.register(TextTableViewCell.self)
        tableView.register(TwitterFollowTableViewCell.self)
        tableView.register(VenueHeaderTableViewCell.self)
        tableView.register(MapTableViewCell.self)
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
}

extension WorkshopDetailViewController: SpeakerImageDelegate {
    func didTapSpeakerImage(forSpeaker speaker: Speaker) {
        let vc = SpeakerDetailViewController()
        vc.speaker = speaker
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

