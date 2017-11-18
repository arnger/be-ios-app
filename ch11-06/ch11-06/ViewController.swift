//
//  ViewController.swift
//  ch11-06
//
//  Created by NTUBIMD on 2017/11/18.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myText.text = NSLocalizedString("myLocalName", comment: "")
        myNameLabel.text = NSLocalizedString("myLocalNameLabel", comment: "")
        myVerLabel.text = NSLocalizedString("myLocalVersion", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myText: UITextField!
    
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myVerLabel: UILabel!
}

