//
//  SessionDetailInterfaceController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/27/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import WatchKit
import TrySwiftData
import Foundation

class SessionDetailInterfaceController: WKInterfaceController {
    
    @IBOutlet var timeInterfaceLabel: WKInterfaceLabel!
    @IBOutlet var titleInterfaceLabel: WKInterfaceLabel!
    @IBOutlet var speakerImage: WKInterfaceImage!
    @IBOutlet var speakerNameLabel: WKInterfaceLabel!
    @IBOutlet var speakerTwitterLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let sessionBlock = context as? SessionBlock {
            configureSessionBlock(sessionBlock)
        }
        
        
    }
    
    private func configureSessionBlock(_ sessionBlock: SessionBlock) {
        timeInterfaceLabel.setText(sessionBlock.timeString)
        
        if let session = sessionBlock.sessions.first {
            let viewModel = SessionViewModel(session: session)
            titleInterfaceLabel.setText(viewModel.title)
            speakerNameLabel.setText(viewModel.presenter)
            speakerTwitterLabel.setText(viewModel.twitter)
            
            do {
                let image = try UIImage(data: Data(contentsOf: viewModel.imageURL))
                speakerImage.setImage(image)
            } catch {
                
            }
        }
    }
}
