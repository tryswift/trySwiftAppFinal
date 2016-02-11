//
//  QASessionsTableViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class QASessionsTableViewController: UITableViewController {

    var dataSource: QASessionDataSourceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(QASessionTableViewCell), bundle: nil), forCellReuseIdentifier: String(QASessionTableViewCell))
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.qaSessions.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(QASessionTableViewCell), forIndexPath: indexPath) as! QASessionTableViewCell
        
        let qaSession = dataSource.qaSessions[indexPath.section]
        cell.configure(withQASession: qaSession)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let session = dataSource.qaSessions[section]
        return "\(session.startTime.stringFromFormat("H:mm")) - \(session.endTime.stringFromFormat("H:mm"))"
    }

}

extension QASessionsTableViewController: IndicatorInfoProvider {
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: dataSource.header)
    }
}
