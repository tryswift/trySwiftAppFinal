//
//  TodayController.swift
//  trySwift
//
//  Created by Alvin Varghese on 22/02/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import UIKit
import Foundation
import NotificationCenter

class TodayController: UIViewController, NCWidgetProviding {
    
    //MARK: Outlets
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var formattedTitle: UILabel!
    @IBOutlet weak var displayPicture: UIImageView!
    @IBOutlet weak var formattedSubTitle: UILabel!
    @IBOutlet weak var twitter: UILabel!
    @IBOutlet weak var presentationSummay: UILabel!
    
   // MARK: Local Variables
    
    lazy var sessionDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter
    }()
    
    //MARK: View Life Cycle
    
    // View Will Appear
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Load data from iOS
        
        self.extractDataFromUserDefaults()
    }
    
    // View Did Load 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded

        self.displayPicture.layer.cornerRadius = self.displayPicture.frame.size.width / 2
        self.displayPicture.clipsToBounds = true
    }
    
    // Get data from iOS using App Groups 
    
    func extractDataFromUserDefaults() {
        
         if let shared = UserDefaults(suiteName: "group.com.tryTokyoTodaysExtension"), let extensionData = shared.value(forKey: "extensionData") as? [[String : AnyObject]] {
            
            if let dict = extensionData.first {
                
                if let startTime = dict["startTime"] as? Date, let endTime = dict["endTime"] as? Date, let session = dict["sessions"] as? [String : String] {
                    
                    // Time 
                    
                    self.time.text = "\(self.sessionDateFormatter.string(from: startTime)) - \(self.sessionDateFormatter.string(from: endTime))"
                    
                    // Formatted Title
                    
                    self.formattedTitle.text = session["title"]
                    
                    // Formattted Subtitle 
                    
                    self.formattedSubTitle.text = session["subTitle"]
                    
                    print(session["sessionDescription"])
                    print(session["logoURL"])
                    
                    // Twiiter 
                    
                    self.twitter.text = session["twitter"]
                    
                    // Presentation Summary 
                    
                    self.presentationSummay.text = session["presentationSummary"]
                }
            }
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
            
        }
        else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: 320, height: 342)
            
            // Unhide
            
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











