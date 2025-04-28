//
//  OnlineViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit
import WebKit


class OnlineViewController: UIViewController {
    var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = UIWebView(frame:self.view.bounds)
        
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleLeftMargin, .flexibleTopMargin]
        
        if let url = URL(string: "https://studiofitindia.com") {
            webView.loadRequest(URLRequest(url: url))
        }
        
        self.view.addSubview(webView)
        
        
        
    }
}

