//
//  WebDisplayViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import WebKit

private let application = UIApplication.sharedApplication()

class WebDisplayViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var url: NSURL!
    var displayTitle: String?
    private var webView: WKWebView!
    
    var showNetworkActivityIndicator: Bool = false {
        didSet {
            if showNetworkActivityIndicator {
                activityIndicator.startAnimating()
                application.networkActivityIndicatorVisible = true
            } else {
                activityIndicator.stopAnimating()
                application.networkActivityIndicatorVisible = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: self.view.frame)
        webView.subviews.forEach { $0.backgroundColor = .clearColor() }
        webView.navigationDelegate = self
        webView.allowsLinkPreview = true
        view.insertSubview(webView, aboveSubview: activityIndicator)
        
        webView.loadRequest(NSURLRequest(URL: url))
        showNetworkActivityIndicator = true
        
        title = displayTitle
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        showNetworkActivityIndicator = false
    }
}

extension WebDisplayViewController: WKNavigationDelegate {
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        showNetworkActivityIndicator = false
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error.localizedDescription)
        showNetworkActivityIndicator = false
    }
}
