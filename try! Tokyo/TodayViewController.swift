//
//  TodayViewController.swift
//  try! Tokyo
//
//  Created by Alvin Varghese on 21/02/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import UIKit
import NotificationCenter

//MARK: UITableViewDataSource

extension TodayViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : TokyoTodayTableViewCell.self), for: indexPath) as! TokyoTodayTableViewCell
        
        return cell
    }
}

class TodayViewController: UIViewController, NCWidgetProviding {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Todays Extension Height
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        // App Groups 
        
        let shared = UserDefaults(suiteName: "group.com.tryTokyoTodayExtension")
        print(shared)
        shared?.synchronize()

        // Load data from UserDefaults
        
        if let extensionData = shared?.value(forKey: "extensionData") as?  [[String : AnyObject]] {
            
            extensionData.forEach({ eachValue in
                
                let startTime = eachValue["startTime"] as? Date
                let endTime = eachValue["endTime"] as? Date
                let sessions = eachValue["sessions"] as? [String : String]
                
                print("\(startTime) || \(endTime)")
            })
        }
        
        
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        }
        else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: 320, height: 342)
        }
    }
    
}




