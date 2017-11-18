//
//  ViewController.swift
//  ch12-02
//
//  Created by NTUBIMD on 2017/11/18.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myName : UITextField!
    @IBOutlet weak var myAddress : UITextField!
    @IBOutlet weak var myPhone : UITextField!

    @IBAction func tapLoad(sender:AnyObject){
        
    }
    @IBAction func tapSave(sender:AnyObject){
        
    }


}

