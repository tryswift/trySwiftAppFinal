//
//  ScheduleViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import XLPagerTabStrip

class ScheduleViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = isJapanese ? "スケジュール" : "Schedule"
        buttonBarView.registerNib(UINib(nibName: "NavTabButtonCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        buttonBarView.backgroundColor = .whiteColor()
        settings.style.selectedBarBackgroundColor = .whiteColor()
        buttonBarView.selectedBar.backgroundColor = UIColor.trySwiftAccentColor()
    }
    
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let sessionDay1ViewController = SessionsTableViewController()
        sessionDay1ViewController.dataSource = SessionDataSourceDay1()
        
        let sessionDay2ViewController = SessionsTableViewController()
        sessionDay2ViewController.dataSource = SessionDataSourceDay2()
        
        let sessionDay3ViewController = SessionsTableViewController()
        sessionDay3ViewController.dataSource = SessionDataSourceDay3()
        
        return [sessionDay1ViewController, sessionDay2ViewController, sessionDay3ViewController]
    }
}