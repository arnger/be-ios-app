//
//  ViewController.swift
//  ch08-01
//
//  Created by NTUBIMD on 2017/11/4.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myUrl = URL(string: "http://www.business-engineer.com")
        
        let myUrlReq = URLRequest(url: myUrl!)
        
        myWebView.loadRequest(myUrlReq)
        
          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var myNavigate: UITextField!
    @IBOutlet weak var myWebKitView: WKWebView!
    @IBAction func goText(_ sender: Any) {
        let myUrl1 = URL(string: myNavigate.text!)
        
        let myUrlReq1 = URLRequest(url: myUrl1!)
        
        myWebKitView.load(myUrlReq1)
    }
    
}

