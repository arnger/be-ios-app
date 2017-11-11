//
//  myViewController.swift
//  ch09-06
//
//  Created by NTUBIMD on 2017/11/11.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class myViewController: UIViewController {
    
    let myDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField2.text = myDelegate.myString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myTextField2: UITextField!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBAction func tapButton(_ sender: Any) {
        myDelegate.myString = myTextField2.text
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
