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
    private var hasMovedToTodaysDate = false

    private let days = ConferenceDay.all
    
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
        buttonBarView.selectedBar.backgroundColor = .trySwiftAccentColor
        
        tabBarController?.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // sadly not isBeingPresented nor isMovingToParentViewController
        // is not working here so we have to store the state locally
        if !hasMovedToTodaysDate {
            hasMovedToTodaysDate = true
            moveToCorrectDate()
        }
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
    
    @discardableResult
    func moveToCorrectDate(animated: Bool = false) -> Int? {
        if days.count > 1 {
            let calendar = Calendar.current
            if let todaysIndex = days.enumerated()
                .first(where:{ calendar.isDateInToday($0.element.date) })
                .map({$0.offset}) {
                moveToViewController(at: todaysIndex, animated: animated)
                return todaysIndex
            }
        }
        
        return .none
    }
}

extension ScheduleViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard
            tabBarController.selectedViewController === viewController,
            navigationController?.viewControllers.last === self
            else { return true }

        guard
            let index = moveToCorrectDate(animated: true),
            let controller = viewControllers[index] as? SessionsTableViewController
            else { return true }
        controller.scrollToCurrentSession(animated: true)

        return true
    }
}
