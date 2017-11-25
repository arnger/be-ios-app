//
//  ViewController.swift
//  ch14-10
//
//  Created by NTUBIMD on 2017/11/25.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myView.layer.shadowOpacity = 1
        myView.layer.shadowRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var myView : UIView!;
    
    var menuShowing = true
    
    @IBAction func openMenu(_ sender: Any) {
        if (menuShowing) {
            UIView.animate(withDuration: 1.0 , animations:
                {self.myView.frame.origin.x = -140})
            menuShowing = false
        } else {
            UIView.animate(withDuration: 1.0 , animations:
                {self.myView.frame.origin.x = 0})
            menuShowing = true
        }
    }
    
    @IBAction func leftEdgePan(_ sender:
        UIScreenEdgePanGestureRecognizer) {
        switch sender.state {
        case .ended:
            UIView.animate(withDuration: 1.0 , animations:
                {self.myView.frame.origin.x = 0 })
            menuShowing = true
        default: break
        }
    }

    @IBAction func leftSwip(_ sender:
        UISwipeGestureRecognizer) {

            UIView.animate(withDuration: 1.0 , animations:
                {self.myView.frame.origin.x = -140 })
            menuShowing = false

        }
    
}

