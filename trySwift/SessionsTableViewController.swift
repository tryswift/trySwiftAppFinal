//
//  SessionsTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import XLPagerTabStrip 

class SessionsTableViewController: UITableViewController {

    var dataSource: SessionDataSourceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(SessionTableViewCell), bundle: nil), forCellReuseIdentifier: String(SessionTableViewCell))
        
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.sessions.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(SessionTableViewCell), forIndexPath: indexPath) as! SessionTableViewCell

        let session = dataSource.sessions[indexPath.section]
        cell.configure(withSession: session)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let session = dataSource.sessions[section]
        return "\(session.startTime.stringFromFormat("H:mm")) - \(session.endTime.stringFromFormat("H:mm"))"
    }

}

extension SessionsTableViewController: IndicatorInfoProvider {
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: dataSource.header)
    }
}

