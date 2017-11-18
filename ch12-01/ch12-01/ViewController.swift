//
//  ViewController.swift
//  ch12-01
//
//  Created by NTUBIMD on 2017/11/18.
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

    @IBOutlet weak var myLoad : UIButton!
    @IBOutlet weak var mySave : UIButton!
    @IBOutlet weak var myText : UITextField!

    @IBAction func tapSave(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(myText.text, forKey: "userData")
        
    }
    @IBAction func tapLoad(_ sender: Any) {
        let defaults = UserDefaults.standard
        myText.text = defaults.string(forKey: "userData")
    }
}

