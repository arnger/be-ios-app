//
//  ViewController.swift
//  ch14-03
//
//  Created by NTUBIMD on 2017/11/25.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTextView.text = "";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func singleTouches(_ sender: UITapGestureRecognizer) {
        myTextView.text = "單指連點兩下時觸發"
        // 取得每指的位置
        self.findFingersPositon(recognizer: sender)
    }
    
    @IBAction func doubleTouches(_ sender: UITapGestureRecognizer) {
        myTextView.text = "雙指點⼀下時觸發"
        // 取得每指的位置
        self.findFingersPositon(recognizer: sender)
    }
    
    func findFingersPositon(recognizer:UITapGestureRecognizer)
    {
        // 取得每指的位置
        let number = recognizer.numberOfTouches
        for i in 0..<number {
            let point = recognizer.location(ofTouch: i, in:
                recognizer.view)
            myTextView.text = myTextView.text.appending("\n第\(i + 1) 指的位置：\(NSStringFromCGPoint(point))" )
        }
    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            myTextView.text = "長按開始"
        } else if sender.state == .ended {
            myTextView.text = "長按結束"
        }
    }
    
}

