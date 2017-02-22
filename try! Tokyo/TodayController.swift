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
    @IBOutlet weak var formattedLocation: UILabel!
    
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
        self.formattedTitle.textColor = UIColor(red: 251 / 255, green: 96 / 255, blue: 0 / 255, alpha: 0.7)
    }
    
    // View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Expanded Mode 
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        self.displayPicture.layer.cornerRadius = self.displayPicture.frame.size.width / 2
        self.displayPicture.clipsToBounds = true
    }
    
    // Get data from iOS using App Groups
    
    func extractDataFromUserDefaults() {
        
        if let shared = UserDefaults(suiteName: "group.com.tryTokyoTodaysExtension"), let extensionData = shared.value(forKey: "extensionData") as? [[String : AnyObject]] {
            
             let dict = extensionData[5]
                
                if let startTime = dict["startTime"] as? Date, let endTime = dict["endTime"] as? Date, let session = dict["sessions"] as? [String : String] {
                    
                    // Time
                    
                    self.time.text = "\(self.sessionDateFormatter.string(from: startTime)) - \(self.sessionDateFormatter.string(from: endTime))"
                    
                    // Formatted Title
                    
                    self.formattedTitle.text = session["title"]
                    
                    // Formattted Subtitle
                    
                    if session["subTitle"] != "" && session["subTitle"] != nil && session["subTitle"] != " " {
                        self.formattedSubTitle.text = session["subTitle"]
                        
                    }
                    else {
                        self.formattedSubTitle.text = session["sessionDescription"]
                    }
                    
                    // Formatted Location 
                    
                    self.formattedLocation.text = session["formattedLocation"]
                    
                    // Image
                    
                    if let logoURL = session["logoURL"] {
                        
                        // Local Image 
                        
                        if logoURL.hasPrefix("file:///") {
                            if let url = URL(string: logoURL) {
                                let lastPathComponent = url.lastPathComponent
                                self.displayPicture.image = UIImage(named: lastPathComponent)
                            }
                        }
                        else {
                            
                        }
                        
                    }

                    // Twiiter
                    
                    self.twitter.text = session["twitter"]
                    
                    // Presentation Summary
                    
                    self.presentationSummay.text = session["presentationSummary"]
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
            
            // Hide
            
            self.presentationSummay.isHidden = true
            self.displayPicture.isHidden = true
            self.formattedSubTitle.isHidden = true
            self.formattedLocation.isHidden = true
            self.twitter.isHidden = true
            
            self.preferredContentSize = maxSize
        }
        else if activeDisplayMode == .expanded {
            
            // Unhide
            
            self.preferredContentSize = CGSize(width: 320, height: 342)
            self.presentationSummay.isHidden = false
            self.displayPicture.isHidden = false
            self.formattedSubTitle.isHidden = false
            self.formattedLocation.isHidden = false
            self.twitter.isHidden = false
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











