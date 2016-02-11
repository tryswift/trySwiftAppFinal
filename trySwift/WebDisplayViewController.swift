//
//  WebDisplayViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class WebDisplayViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var url: NSURL!
    var displayTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        webView.loadRequest(NSURLRequest(URL: url))
        activityIndicator.startAnimating()
        
        title = displayTitle
    }

}

extension WebDisplayViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        activityIndicator.stopAnimating()
    }
}
