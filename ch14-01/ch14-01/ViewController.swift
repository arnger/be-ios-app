//
//  ViewController.swift
//  ch14-01
//
//  Created by NTUBIMD on 2017/11/25.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myMethod : UITextField!;
    @IBOutlet weak var myTouches : UITextField!;
    @IBOutlet weak var myTaps : UITextField!;
    @IBOutlet weak var myX : UITextField!;
    @IBOutlet weak var myY : UITextField!;
    var point : CGPoint?
    
    @IBOutlet weak var myStaut :UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchCount = touches.count
        let touch = touches.first
        let tapCount = touch!.tapCount
        
        myMethod.text = "touchesBegan"
        myTouches.text = "\(touchCount) touches"
        myTaps.text = "\(tapCount) taps"
        point = (touch?.location(in: view))
        myX.text = String(describing: point?.x)
        myY.text = String(describing: point?.y)
        
        A14_02("MOVE",touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchCount = touches.count
        let touch = touches.first
        let tapCount = touch!.tapCount
        
        myMethod.text = "touchesEnded"
        myTouches.text = "\(touchCount) touches"
        myTaps.text = "\(tapCount) taps"
        point = (touch?.location(in: view))!
        myX.text = String(describing: point?.x)
        myY.text = String(describing: point?.y)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchCount = touches.count
        let touch = touches.first
        let tapCount = touch!.tapCount
        
        myMethod.text = "touchesMoved"
        myTouches.text = "\(touchCount) touches"
        myTaps.text = "\(tapCount) taps"
        point = (touch?.location(in: view))!
        myX.text = String(describing: point?.x)
        myY.text = String(describing: point?.y)
        
        A14_02("MOVE",touches)
    }
    
    
    func A14_02(_ event : String,_ touches: Set<UITouch>){
        var startPoint = CGPoint(x:0, y:0)
        var currentPoint = CGPoint(x:0, y:0)
        if (event == "MOVE") {
            let touch = touches.first
            currentPoint = (touch?.location(in: view))!
            
            if ( fabsf(Float((startPoint.x) - (currentPoint.x))) >
                10) && ( fabsf(Float((startPoint.y) - (currentPoint.y))) < 10){
                // ⽔平移動
                if ( (startPoint.x) - (currentPoint.x) > 10){
                    myStaut.text = "向左滑"
                } else{
                    myStaut.text = "向右滑"
                }
            } else if( fabsf(Float((startPoint.x) -
                (currentPoint.x))) < 10) && ( fabsf(Float((startPoint.y) -
                    (currentPoint.y))) > 10) {
                // 垂直移動
                if ( (startPoint.y) - (currentPoint.y) > 10){
                    myStaut.text = "向上滑"
                } else{
                    myStaut.text = "向下滑"
                }
            }
        }
        if (event == "BEGAN"){
            let touch = touches.first
            startPoint = (touch?.location(in: view))!
        }
        
    }


}

