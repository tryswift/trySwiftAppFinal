//
//  UIViewControllerExtension.swift
//  trySwift
//
//  Created by Bas Broek on 4/16/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Foundation
import SafariServices
import MessageUI

extension UIViewController: SFSafariViewControllerDelegate {
    
    func openSafariViewController(withURL url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        present(safariViewController, animated: true)
    }
}

extension UIViewController: MFMailComposeViewControllerDelegate {
    
    func sendMail(withConfiguration configuration: MailConfiguration) {
        if MFMailComposeViewController.canSendMail() {
            let mailViewController: MFMailComposeViewController = {
                let mailViewController = MFMailComposeViewController()
                mailViewController.mailComposeDelegate = self
                mailViewController.setToRecipients(configuration.recipients)
                mailViewController.setSubject(configuration.subject)
                mailViewController.navigationBar.tintColor = .white
                return mailViewController
            }()
            
            present(mailViewController, animated: true)
        } else {
            let format = "Please reach out to us via %@."
            let message = String.localizedStringWithFormat(format, configuration.recipients.first ?? "email".localized())
            let alert = UIAlertController(title: "Could not send email".localized(), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK".localized(), style: .default))
            present(alert, animated: true)
        }
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }
}
