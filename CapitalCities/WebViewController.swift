//
//  WebViewController.swift
//  CapitalCities
//
//  Created by Mihai Leonte on 10/8/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var url = URL(string: "https://www.google.com")!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: url))
    }
    
}
