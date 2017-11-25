//
//  ViewController.swift
//  ch14-09
//
//  Created by NTUBIMD on 2017/11/25.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var firstTouchLocation: CGPoint!
    @IBOutlet weak var myView : UIView!
    @IBOutlet weak var myTextField : UITextField!
    @IBAction func leftEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
        // Get the current view we are touching
        
        let location = sender.location(in: nil)
        var frame = myView.frame
        
        switch sender.state {
        case .began:
            firstTouchLocation = location
            
        case .changed:
            frame.origin.x = location.x -
                firstTouchLocation.x
            myView.frame = frame
            myTextField.text = String(describing:
                myView.frame.origin.x)
            
        case .ended:
            //myView.frame.origin.x = 0
            UIView.animate(withDuration: 1.0 , animations: {
                self.myView.frame.origin.x = 0
                
            })
            self.myTextField.text = String(describing:
                myView.frame.origin.x)
        default: break
            
        }
    }
}

