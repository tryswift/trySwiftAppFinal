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
import TrySwiftData

extension Date {
    func isBetweeen(date date1: Date, andDate date2: Date) -> Bool {
        return date1.compare(self) == self.compare(date2)
    }
}

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

        let conferenceDays = ConferenceDay.all
        let allSessions = [conferenceDays[0], conferenceDays[1]].flatMap { $0.sessionBlocks }

        var extensionData : [[String : AnyObject]] = []

        allSessions.forEach { value in

            var speakerDictionary : [String : String] = [:]

            if let session = value.sessions.first {

                speakerDictionary["title"] = session.formattedTitle
                speakerDictionary["subTitle"] = session.formattedSubtitle
                speakerDictionary["logoURL"] = session.logoURL.absoluteString
                speakerDictionary["sessionDescription"] = session.sessionDescription
                speakerDictionary["twitter"] = session.twitter
                speakerDictionary["presentationSummary"] = session.presentationSummary
                speakerDictionary["presentationSummary"] = session.presentationSummary
                speakerDictionary["formattedLocation"] = session.formattedLocation
            }

            extensionData.append([
                "startTime" : value.startTime as AnyObject,
                "endTime" : value.endTime as AnyObject,
                "sessions" :  speakerDictionary as AnyObject
                ])

            extensionData.forEach({ dict in

                if let startTime = dict["startTime"] as? Date, let endTime = dict["endTime"] as? Date, let session = dict["sessions"] as? [String : String] {

                    let currentDate = Date()

                    if currentDate.isBetweeen(date: startTime, andDate: endTime)
                    {
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
                            else if logoURL.hasPrefix("https://") || logoURL.hasPrefix("http://") {
                                if let url = URL(string: logoURL), let data = try? Data(contentsOf: url) {
                                    self.displayPicture.image = UIImage(data: data)
                                }
                            }
                        }

                        // Twiiter

                        self.twitter.text = session["twitter"]

                        // Presentation Summary

                        self.presentationSummay.text = session["presentationSummary"]
                    }
                    else {

                        // Formatted Title

                        self.formattedTitle.text = "try! Swift Conference"

                        // Formattted Subtitle

                        self.formattedSubTitle.text = "❤️"

                        // Formatted Location

                        self.formattedLocation.text = "Tokyo, Japan"

                        // Image

                        self.displayPicture.image = UIImage(named: "Logo")

                        // Twiiter

                        self.twitter.text = "@tryswiftconf"

                        // Presentation Summary

                        self.presentationSummay.text = "try! Conference is an immersive community gathering about Swift Language Best Practices, Application Development in Swift, Server-Side Swift, Open Source Swift, and the Swift Community, taking place in Tokyo on March 2nd through 4th, 2017."

                        let currentDateUnits = self.convertingToEachUnit(date: Date())

                        if currentDateUnits.year == 2017 && currentDateUnits.month == 3 && currentDateUnits.day > 4  {
                            self.time.text = "See You Next Year :)"
                        }
                        else {
                            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDownTimer), userInfo: nil, repeats: true)
                            timer.fire()
                        }
                    }
                }
            })
        }
        
//        self.extractDataFromUserDefaults()
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
            
            extensionData.forEach({ dict in
                
                if let startTime = dict["startTime"] as? Date, let endTime = dict["endTime"] as? Date, let session = dict["sessions"] as? [String : String] {
                    
                     let currentDate = Date()
                    
                    if currentDate.isBetweeen(date: startTime, andDate: endTime)
                    {
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
                            else if logoURL.hasPrefix("https://") || logoURL.hasPrefix("http://") {
                                if let url = URL(string: logoURL), let data = try? Data(contentsOf: url) {
                                    self.displayPicture.image = UIImage(data: data)
                                }
                            }
                        }
                        
                        // Twiiter
                        
                        self.twitter.text = session["twitter"]
                        
                        // Presentation Summary
                        
                        self.presentationSummay.text = session["presentationSummary"]
                    }
                    else {
                        
                        // Formatted Title
                        
                        self.formattedTitle.text = "try! Swift Conference"
                        
                        // Formattted Subtitle
                        
                        self.formattedSubTitle.text = "❤️"
                        
                        // Formatted Location
                        
                        self.formattedLocation.text = "Tokyo, Japan"
                        
                        // Image
                        
                        self.displayPicture.image = UIImage(named: "Logo")
                        
                        // Twiiter
                        
                        self.twitter.text = "@tryswiftconf"
                        
                        // Presentation Summary
                        
                        self.presentationSummay.text = "try! Conference is an immersive community gathering about Swift Language Best Practices, Application Development in Swift, Server-Side Swift, Open Source Swift, and the Swift Community, taking place in Tokyo on March 2nd through 4th, 2017."
                        
                        let currentDateUnits = self.convertingToEachUnit(date: Date())
                        
                        if currentDateUnits.year == 2017 && currentDateUnits.month == 3 && currentDateUnits.day > 4  {
                            self.time.text = "See You Next Year :)"
                        }
                        else {
                            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDownTimer), userInfo: nil, repeats: true)
                            timer.fire()
                        }
                    }
                }
            })
        }
    }
    
    func countDownTimer()
    {
        let requestedComponent: Set<Calendar.Component> = [.day,.hour,.minute,.second]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm:ss"
        let startTime = Date()
        let endTime = dateFormatter.date(from: "02/03/17 08:30:00")
        let timeDifference = Calendar.current.dateComponents(requestedComponent, from: startTime, to: endTime!)
        
        self.time.text = "Countdown : \(timeDifference.day!):\(timeDifference.hour!):\(timeDifference.minute!):\(timeDifference.second!)"
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











