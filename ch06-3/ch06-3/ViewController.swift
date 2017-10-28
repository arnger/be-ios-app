//
//  ViewController.swift
//  ch06-3
//
//  Created by NTUBIMD on 2017/10/28.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myImageView.image = #imageLiteral(resourceName: "apple.png");
        myButton.setTitle("Play", for: .normal);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func tapButtom(_ sender: Any) {
        /*
         UIView.animate(withDuration: 3.0, animations: {
            self.myImageView.transform = CGAffineTransform(scaleX:0.4,y:0.4);
        })
        */
        
        UIView.beginAnimations("animation", context: nil);
        UIView.setAnimationDuration(3);
        myImageView.transform = CGAffineTransform(scaleX:0.4,y:0.4);
        myImageView.center = CGPoint(x:300,y:480);
        UIView.commitAnimations();
        
    }
}

