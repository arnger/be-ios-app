//
//  ViewController.swift
//  ch09-06
//
//  Created by NTUBIMD on 2017/11/11.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTextField1.text = myDelegate.myString;
    }

    @IBOutlet weak var myTextField1: UITextField!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBAction func tapButton(_ sender: Any) {
        myDelegate.myString = myTextField1.text;
        let vc1 = storyboard?.instantiateViewController(withIdentifier:
                "myViewController") as! myViewController
        vc1.transitioningDelegate = self as? UIViewControllerTransitioningDelegate //設置過渡代理
        present(vc1, animated: true, completion: nil)
        
    }
}

