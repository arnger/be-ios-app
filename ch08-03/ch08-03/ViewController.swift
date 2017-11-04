//
//  ViewController.swift
//  ch08-03
//
//  Created by NTUBIMD on 2017/11/4.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myActivity.isHidden = true
        myWebView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myBackButton: UIBarButtonItem!

    @IBOutlet weak var myForwardButton: UIBarButtonItem!

    @IBOutlet weak var myRefreshButton: UIBarButtonItem!

    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var myText: UITextField!
    
    @IBAction func tapText(_ sender: Any) {
        let myUrl = URL(string: myText.text!)
        let myUrlReq = URLRequest(url: myUrl!)
        myWebKit.load(myUrlReq)
        
    }
    
    
    @IBAction func tapBack(_ sender: Any) {
        myWebKit.goBack();
    }
    
    @IBAction func tapForward(_ sender: Any) {
        myWebKit.goForward();
    }
    
    @IBAction func tapRefresh(_ sender: Any) {
        myWebKit.reload();
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivity.startAnimating()
        myActivity.isHidden = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivity.stopAnimating()
        myActivity.isHidden = true
        
        //let currentReq = myWebKit.url
        myText.text = myWebKit.url!.absoluteString
    }
    
    @IBOutlet weak var myWebKit: WKWebView!
    @IBOutlet weak var myWebView: UIWebView!
}

