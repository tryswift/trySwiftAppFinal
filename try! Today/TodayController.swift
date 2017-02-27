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


        self.formattedTitle.textColor = UIColor(red: 251 / 255, green: 96 / 255, blue: 0 / 255, alpha: 0.7)
    }
    
    // View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayPicture.layer.shouldRasterize = true
        self.displayPicture.layer.rasterizationScale = UIScreen.main.scale
        self.displayPicture.layer.minificationFilter = "trilinear"
        self.displayPicture.layer.cornerRadius = self.displayPicture.frame.size.width / 2
        self.displayPicture.clipsToBounds = true
    }
    
    

    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
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











