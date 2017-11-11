//
//  myViewController.swift
//  ch09-05
//
//  Created by NTUBIMD on 2017/11/11.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class myViewController: UIViewController {
    var myString = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = myString;
        myTextField.text = myString;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    func setMyString(msg : String) {
        myString = msg;
    }
    
}
