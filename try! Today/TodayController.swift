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
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var displayPictureView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var visualEffectsView: UIVisualEffectView!

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Local Variables
    
    private var currentSessionBlock: SessionBlock? {
        let sessionBlocks = SessionBlock.all
        
        let est = TimeZone(abbreviation: "JST")!
        let date = Date().addingTimeInterval((Double)(est.secondsFromGMT()))
        return sessionBlocks.filter { $0.startTime < date && $0.endTime > date }.first
    }

    private var firstSessionBlock: SessionBlock? {
        let sessionBlocks = SessionBlock.all
        return sessionBlocks.sorted { $0.startTime < $1.startTime }.first
    }

    private var lastSessionBlock: SessionBlock? {
        let sessionBlocks = SessionBlock.all
        return sessionBlocks.sorted { $0.startTime > $1.startTime }.first
    }

    lazy var sessionDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = NSLocalizedString("h:mm a", comment: "")
        return dateFormatter
    }()

    lazy var countdownTimeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .day]
        formatter.unitsStyle = .full
        return formatter
    }()
    
    //MARK: View Life Cycle
    
    // View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapRecognizer)

        self.extensionContext?.widgetLargestAvailableDisplayMode = .compact

        self.visualEffectsView.effect = UIVibrancyEffect.widgetPrimary()
        self.titleLabel.textColor = UIColor(red: 251 / 255, green: 96 / 255, blue: 0 / 255, alpha: 0.7)

        self.displayPictureView.layer.shouldRasterize = true
        self.displayPictureView.layer.rasterizationScale = UIScreen.main.scale
        self.displayPictureView.layer.minificationFilter = "trilinear"
        self.displayPictureView.layer.cornerRadius = self.displayPictureView.frame.size.width / 2
        self.displayPictureView.layer.masksToBounds = true

        //Update the view depending on the current state
        if let sessionBlock = currentSessionBlock, let session = currentSessionBlock?.sessions.first {
            let viewModel = SessionViewModel(session: session)
            titleLabel.text = viewModel.title
            displayPictureView.image = UIImage(contentsOfFile: viewModel.imageURL.path)
            subTitleLabel.text = viewModel.presenter
            typeLabel.text = viewModel.shortDescription
            
            let firstTimeString = sessionDateFormatter.string(from: sessionBlock.startTime)
            let lastTimeString = sessionDateFormatter.string(from: sessionBlock.endTime)
            timeLabel.text = String(format: "%@ - %@", firstTimeString, lastTimeString)
            return
        }
        
        // Check if we're still before the conference
        let startOfConference = firstSessionBlock!.startTime
        if Date() < startOfConference {
            let interval = startOfConference.timeIntervalSinceNow
            timeLabel.text = countdownTimeFormatter.string(from: interval)
            return
        }
        
        // Check if the conference has ended
        let endOfConference = lastSessionBlock!.endTime
        if Date() > endOfConference {
            timeLabel.text = NSLocalizedString("See you next time!", comment: "")
        }
    }

    @objc private func viewTapped() {
        let url = URL(string: "tryswift://")!
        extensionContext?.open(url, completionHandler: nil)
    }
}










