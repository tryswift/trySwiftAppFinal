//
//  ScheduleViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import XLPagerTabStrip
import TrySwiftData
import Timepiece

class ScheduleViewController: ButtonBarPagerTabStripViewController {

    let days = ConferenceDay.all
    
    fileprivate let sessionDetailsSegue = "sessionDetailsSegue"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "Schedule".localized()
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
        let sessionDay1ViewController = SessionsTableViewController(conferenceDay: days[0], scheduleViewController: self)
        let sessionDay2ViewController = SessionsTableViewController(conferenceDay: days[1], scheduleViewController: self)
        let sessionDay3ViewController = SessionsTableViewController(conferenceDay: days[2], scheduleViewController: self)
        return [sessionDay1ViewController, sessionDay2ViewController, sessionDay3ViewController]

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == sessionDetailsSegue,
            let navigationVC = segue.destination as? UINavigationController,
            let sessionVC = sender as? UIViewController else { return }
        
         navigationVC.pushViewController(sessionVC, animated: true)
    }
}

private extension ScheduleViewController {
    
    func moveToCorrectDate() {
        let today = Date.today()
        
        let day2 = days[1].date
        if today == day2 {
            moveToViewController(at: 1)
        }
        
        let day3 = days[2].date
        if today == day3 {
            moveToViewController(at: 2)
        }
    }
}
