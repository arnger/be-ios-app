//
//  ViewController.swift
//  ch05-12
//
//  Created by NTUBIMD on 2017/10/28.
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
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    @IBAction func doMyStepper(_ sender: UIStepper) {
        myLabel.text = "\(sender.value)";
    }
    

}

