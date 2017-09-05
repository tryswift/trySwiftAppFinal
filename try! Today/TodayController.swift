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

    private var currentSession: Session? {
        guard let sessionBlocks = SessionBlock.all else { return nil }
        
        let est = TimeZone(abbreviation: "EST")!
        let date = Date().addingTimeInterval((Double)(est.secondsFromGMT()))
        let currentSessionBlock = sessionBlocks.filter("startTime < %@ AND endTime > %@", date, date)
        return currentSessionBlock.first?.sessions.first
    }

    private var firstSession: Session? {
        guard let sessionBlocks = SessionBlock.all else { return nil }
        return sessionBlocks.sorted(byKeyPath: "startTime").first?.sessions.first
    }

    private var lastSession: Session? {
        guard let sessionBlocks = SessionBlock.all else { return nil }
        return sessionBlocks.sorted(byKeyPath: "startTime", ascending: false).first?.sessions.first
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
        if let session = currentSession {
            let viewModel = SessionViewModel(session: session)
            titleLabel.text = viewModel.title
            displayPictureView.image = UIImage(contentsOfFile: viewModel.imageURL.path)
            subTitleLabel.text = viewModel.presenter
            typeLabel.text = viewModel.shortDescription

            let sessionBlock = session.sessionBlock.first!
            
            let firstTimeString = sessionDateFormatter.string(from: sessionBlock.startTime)
            let lastTimeString = sessionDateFormatter.string(from: sessionBlock.endTime)
            timeLabel.text = String(format: "%@ - %@", firstTimeString, lastTimeString)
            return
        }

        // Check if we're still before the conference
        if let session = firstSession {
            let startOfConference = session.sessionBlock.first!.startTime
            if Date() < startOfConference {
                let interval = startOfConference.timeIntervalSinceNow
                timeLabel.text = countdownTimeFormatter.string(from: interval)
                return
            }
        }

        // Check if the conference has ended
        if let session = lastSession {
            let endOfConference = session.sessionBlock.first!.endTime
            if Date() > endOfConference {
                timeLabel.text = NSLocalizedString("See you next time!", comment: "")
            }
        }
    }

    @objc private func viewTapped() {
        let url = URL(string: "tryswift://")!
        extensionContext?.open(url, completionHandler: nil)
    }
}










