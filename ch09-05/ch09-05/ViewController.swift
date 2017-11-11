//
//  ViewController.swift
//  ch09-05
//
//  Created by NTUBIMD on 2017/11/11.
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let mySecondView = segue.destination as! myViewController
        
        mySecondView.setMyString(msg: myTextField.text!)
        
    }

    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func exitSecondaryView (Segue : UIStoryboardSegue){
        let mySecondView = Segue.source as! myViewController
        myTextField.text = mySecondView.myTextField.text;
    }
}

