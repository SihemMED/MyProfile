//
//  WebViewController.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/4/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var isLoaded: Bool = false
    var url: String
    lazy var activityIndicator : UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = Style.Colors.mongo
        activityIndicatorView.style = .large
        activityIndicatorView.center = view.center
        return activityIndicatorView
    }()
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoaded = true
        setupUI()
    }

    private func setupUI() {
        webView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        if isLoaded {
            if let url = URL(string: url ){
                webView.load(URLRequest(url: url))
            }
        }
    }


}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
