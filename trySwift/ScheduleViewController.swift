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
        
        title = "Schedule"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonBarView.register(UINib(nibName: "NavTabButtonCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        buttonBarView.backgroundColor = .white
        settings.style.selectedBarBackgroundColor = .white
        buttonBarView.selectedBar.backgroundColor = .trySwiftAccentColor()
        
        moveToCorrectDate()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
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
        let today = Date.today()
        
        let day2 = Date(year: 2016, month: 9, day: 1)
        if today == day2 {
            moveToViewController(at: 1)
        }
        
        let day3 = Date(year: 2016, month: 9, day: 2)
        if today == day3 {
            moveToViewController(at: 2)
        }
    }
}
