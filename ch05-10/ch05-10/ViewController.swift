//
//  ViewController.swift
//  ch05-10
//
//  Created by NTUBIMD on 2017/10/28.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.text = mySegCtrl.titleForSegment(at: 0);
        myProgresView.progress = 0 ;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var myProgresView: UIProgressView!
    @IBOutlet weak var myBtn: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySegCtrl: UISegmentedControl!
    @IBAction func doMySegCtrl(_ sender: Any) {
        switch (mySegCtrl.selectedSegmentIndex){
        case 0 : myLabel.text = mySegCtrl.titleForSegment(at: 0);
        case 1 : myLabel.text =
            mySegCtrl.titleForSegment(at: 1);
        case 2 : myLabel.text =
            mySegCtrl.titleForSegment(at: 2);
        default :
            break
        }
    }
    @IBAction func doMyBtn(_ sender: Any) {
        myProgresView.progress = myProgresView.progress + 0.1
        if (myProgresView.progress >= 1){
            myProgresView.progress = 0;
        }
    }
    
    

}

