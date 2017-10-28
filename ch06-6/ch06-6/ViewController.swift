//
//  ViewController.swift
//  ch06-6
//
//  Created by NTUBIMD on 2017/10/28.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var startTime = NSDate.timeIntervalSinceReferenceDate;
    var timer = Timer();
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var myLabel: UILabel!

    @IBAction func tapButton(_ sender: UIButton) {
        startTime = NSDate.timeIntervalSinceReferenceDate;
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(checkTime), userInfo: nil, repeats: true);
        }
    
    @objc func checkTime(){
        let currentTime = NSDate.timeIntervalSinceReferenceDate;
    let elapsedTime = 180 - ( currentTime - startTime )

    let minutes = Int16(elapsedTime / 60.0)
    let seconds = Int16(fmod(elapsedTime, 60))
    let strMinutes = String(format: "%02d", minutes)
    let strSeconds = String(format: "%02d", seconds)
    myLabel.text = "\(strMinutes):\(strSeconds)"

    if (elapsedTime <= 0)
    { timer.invalidate()
    let alertController = UIAlertController (title: "計時器", message: "倒數計時結束", preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "確定", style: .default,  handler: {action in self.myLabel.text = "倒數結束!" } ))
        present(alertController, animated: true,completion: nil)
        }
    }

}

