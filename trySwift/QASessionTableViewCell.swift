//
//  QASessionTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

protocol QASessionSpeakerPopDelegate: class {
    func onCommitViewController(viewController: UIViewController)
}

class QASessionTableViewCell: UITableViewCell {

    @IBOutlet weak var qaSessionTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var speaker1ImageView: UIImageView!
    @IBOutlet weak var speaker2ImageView: UIImageView!
    @IBOutlet weak var speaker3ImageView: UIImageView!
    
    private var qaSession: QASession?
    private var delegate: QASessionSpeakerPopDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        qaSessionTitleLabel.textColor = .trySwiftTitleColor()
        locationLabel.textColor = .trySwiftSubtitleColor()
        
        speaker1ImageView.clipsToBounds = true
        speaker2ImageView.clipsToBounds = true
        speaker3ImageView.clipsToBounds = true        
    }

    func configure(withQASession qaSession: QASession, delegate: QASessionSpeakerPopDelegate) {
        self.qaSession = qaSession
        self.delegate = delegate
        
        qaSessionTitleLabel.text = qaSession.title
        locationLabel.text = qaSession.location
        
        speaker1ImageView.image = qaSession.speakers[0].image
        speaker2ImageView.image = qaSession.speakers[1].image
        speaker3ImageView.image = qaSession.speakers[2].image
    }
    
}

extension QASessionTableViewCell: UIViewControllerPreviewingDelegate {
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let viewsTo3DTouch = [speaker1ImageView, speaker2ImageView, speaker3ImageView]
        
        for (index, view) in viewsTo3DTouch.enumerate() where touchedView(view, location: location) {
            if let speaker = qaSession?.speakers[index] {
                return viewControllerForSpeaker(speaker)
            }
        }
        
        return nil
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController)
    {
        delegate?.onCommitViewController(viewControllerToCommit)
    }
    
    private func touchedView(view: UIView, location: CGPoint) -> Bool {
        let locationInView = view.convertPoint(location, fromView: contentView)
        return CGRectContainsPoint(view.bounds, locationInView)
    }
    
    private func viewControllerForSpeaker(speaker: Speaker) -> UIViewController {
        let speakerDetailVC = SpeakerDetailViewController()
        speakerDetailVC.speaker = speaker
        return speakerDetailVC
    }
}