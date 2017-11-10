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
        return days.map { SessionsTableViewController(conferenceDay: $0, scheduleViewController: self) }

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
        if days.count > 1 {
            let today = Date.today()
            
            let day2 = days[1].date
            if today == day2 {
                moveToViewController(at: 1)
            }
        }
    }
}
