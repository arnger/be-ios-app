//
//  ViewController.swift
//  ch08-02
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
        let myUrl = URL(string: "http://120.97.29.33/welcome.gif")
        let myData = try? Data(contentsOf: myUrl!)
        let myImage = UIImage(data: myData!)
        myImageView.image = myImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myImageView: UIImageView!
   
    @IBOutlet weak var myWebKit: WKWebView!
    @IBOutlet weak var myPlayButton: UIButton!
    @IBAction func tapPlayButton(_ sender: Any) {
        let mp3Url = URL(string: "http://120.97.29.33/1.mp3")
        let urlReq = URLRequest(url: mp3Url!)
        myWebKit.load(urlReq)
        
    }
}

