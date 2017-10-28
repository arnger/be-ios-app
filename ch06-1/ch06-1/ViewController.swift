//
//  ViewController.swift
//  ch06-1
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

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myBtn: UIButton!
    @IBAction func doBtn(_ sender: Any) {
        myImageView.image = UIImage(named:"Banana.png");
        
    }
    @IBAction func showImageBtn(_ sender: UIButton) {
        if (myImageView.isHidden == true)
        {
            myImageView.isHidden = false;
            sender.setTitle("Show", for: .normal);
        }
        else {
            myImageView.isHidden = true;
            sender.setTitle("Hide", for: .normal);
        }
    }
}

