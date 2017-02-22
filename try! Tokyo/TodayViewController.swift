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
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var formattedTitle: UILabel!
    @IBOutlet weak var formattedSubtitle: UILabel!
    @IBOutlet weak var twitter: UILabel!
    @IBOutlet weak var displayPicture: UIImageView!
    @IBOutlet weak var presentationSummary: UILabel!
    
    //MARK: View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayPicture.layer.cornerRadius = self.displayPicture.frame.size.width / 2
        self.displayPicture.clipsToBounds = true
        
        
        // Todays Extension Height
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        // App Groups
        
        let shared = UserDefaults(suiteName: "group.com.tryTokyoTodayExtension")
        shared?.synchronize()
        
        // Load data from UserDefaults
        
        if let extensionData = shared?.value(forKey: "extensionData") as?  [[String : AnyObject]] {
            
            extensionData.forEach({ eachValue in
                
                if let startTime = eachValue["startTime"] as? Date, let endTime = eachValue["endTime"] as? Date {
                    
                    // Converting to Local Time Zone 
                    
//                    let startTimeTimeZoneSeconds = TimeZone.current.secondsFromGMT(for: startTime)
//                    let endTimeTimeZoneSeconds = TimeZone.current.secondsFromGMT(for: endTime)
//                    
//                    let startTimeinLocalTimeZone = startTime.addingTimeInterval(TimeInterval(startTimeTimeZoneSeconds))
//                    let endTimeinLocalTimeZone = startTime.addingTimeInterval(TimeInterval(endTimeTimeZoneSeconds))
                    
                    // Convertint to each Date Component
                    
                    let startTimeUnits = self.convertingToEachUnit(date: startTime)
                    let endTimeUnits = self.convertingToEachUnit(date: endTime)
                    let currentTimeUnits = self.convertingToEachUnit(date: Date())
                    

                    
                    print("\(startTimeUnits.hour):\(startTimeUnits.minute) || \(endTimeUnits.hour):\(endTimeUnits.minute)")
                    
//                    if (currentTimeUnits.hour == startTimeUnits.hour && currentTimeUnits.hour == endTimeUnits.hour) && (currentTimeUnits.minute >= startTimeUnits.minute &&  currentTimeUnits.minute >= endTimeUnits.minute) {
                    
                        if let sessions = eachValue["sessions"] as? [String : String] {
                            
                            // Time 
                            
                            self.time.text = "\(startTimeUnits.hour):\(startTimeUnits.minute) - \(endTimeUnits.hour):\(endTimeUnits.minute)"
                            
                            // Title
                            
                           self.formattedTitle.text = sessions["title"]
                            
                            let u = sessions["logoURL"]
                            
                            print(u)
                            
                            // Subtitle
                            
                            self.formattedSubtitle.text = sessions["name"]                            
                            // Twitter
                            
                            let s = sessions["sessionDescription"]
                            
                            print(s)
                            
                            self.twitter.text = sessions["twitter"]
                            
                            // Presentation Summary
                            
                            self.presentationSummary.text = sessions["presentationSummary"]

                            
                            }
                    }
                // }
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
            
            // Hide 
            
            self.presentationSummary.isHidden = true
        }
        else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: 320, height: 342)
            
            // Unhide
            self.presentationSummary.isHidden = false

        }
    }
    
    func convertingToEachUnit(date : Date) -> (year : Int, month : Int, day : Int, hour : Int, minute : Int) {
        
        let calendar = NSCalendar.current
        let year = calendar.component(.year, from: date as Date)
        let month = calendar.component(.month, from: date as Date)
        let day = calendar.component(.day, from: date as Date)
        let hour = calendar.component(.hour, from: date as Date)
        let minute = calendar.component(.minute, from: date as Date)
        
        return (year : year, month : month, day : day, hour : hour, minute : minute)
    }
    
}




