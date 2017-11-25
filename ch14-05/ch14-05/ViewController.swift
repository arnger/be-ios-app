//
//  ViewController.swift
//  ch14-05
//
//  Created by NTUBIMD on 2017/11/25.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView : UIImageView!;
    
    var fullSize :CGSize! = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        let point = myImageView.center
        if point.x <= fullSize.width - 150 {
            myImageView.center = CGPoint(x:
                myImageView.center.x + 100, y: myImageView.center.y)
        } else {
            myImageView.center = CGPoint(x: fullSize.width - 50,
                                         y: myImageView.center.y)
        }
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        let point = myImageView.center
        if point.x >= 150 {
            myImageView.center = CGPoint(x:
                myImageView.center.x - 100, y: myImageView.center.y)
        } else {
            myImageView.center = CGPoint( x: 50, y:
                myImageView.center.y)
        }
    }
    
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer)
    {
        let point = myImageView.center
        if point.y >= 150 {
            myImageView.center = CGPoint(x:
                myImageView.center.x, y: myImageView.center.y - 100)
        } else {
            myImageView.center = CGPoint(x:
                myImageView.center.x, y: 50)
        }
    }
    
    
    @IBAction func swipeDown(_ sender:
        UISwipeGestureRecognizer) {
        let point = myImageView.center
        if point.y <= fullSize.height - 150 {
            myImageView.center = CGPoint(x:
                myImageView.center.x, y: myImageView.center.y + 100)
        } else {
            myImageView.center = CGPoint(x:
                myImageView.center.x, y: fullSize.height - 50)
        }
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        // 設置 UIImageView 新的位置
        let point = sender.location(in: self.view)
        myImageView.center = point
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began {
            //("開始縮放")
        } else if sender.state == .changed {
            // 縮放比例
            let scale = sender.scale
            // ⽬前圖片寬度
            let w = myImageView.frame.width
            // ⽬前圖片⾼度
            let h = myImageView.frame.height
            // 縮放比例的限制為 0.5 ~ 2 倍
            if w * sender.scale > 100 && w * sender.scale < 400
            {
                myImageView.frame = CGRect(
                    x: myImageView.frame.origin.x, y:
                    myImageView.frame.origin.y,
                    width: w * scale, height: h * scale)
                myImageView.center = CGPoint(x:200, y:400)
            }
        } else if sender.state == .ended {
            //("結束縮放")
        }
    }
    
}

