//
//  ViewController.swift
//  ch06-5
//
//  Created by NTUBIMD on 2017/10/28.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(checkTime), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myLabel: UILabel!
    
    @objc func checkTime(){
        let now = Date();
        var df = DateFormatter();
        df.dateFormat="HH:mm:ss";
        myLabel.text = df.string(for: now);
        
    }
}

