//
//  ScheduleViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import XLPagerTabStrip
import Timepiece

class ScheduleViewController: ButtonBarPagerTabStripViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = isJapanese ? "スケジュール" : "Schedule"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonBarView.registerNib(UINib(nibName: "NavTabButtonCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        buttonBarView.backgroundColor = .whiteColor()
        settings.style.selectedBarBackgroundColor = .whiteColor()
        buttonBarView.selectedBar.backgroundColor = .trySwiftAccentColor()
        
        moveToCorrectDate()
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

private extension ScheduleViewController {
    
    func moveToCorrectDate() {
        let today = NSDate.today()
        
        let day2 = NSDate.date(year: 2016, month: 3, day: 3)
        if today == day2 {
            moveToViewControllerAtIndex(1)
        }
        
        let day3 = NSDate.date(year: 2016, month: 3, day: 4)
        if today == day3 {
            moveToViewControllerAtIndex(2)
        }
    }
}
