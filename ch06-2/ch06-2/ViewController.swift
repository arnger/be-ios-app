//
//  ViewController.swift
//  ch06-2
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
    let imageArray = [#imageLiteral(resourceName: "dance1.png"),#imageLiteral(resourceName: "dance2.png"),#imageLiteral(resourceName: "dance3.png"),#imageLiteral(resourceName: "dance4.png")];
    //let imageArray = [UIImage(named:"dance1.png"),UIImage(named:"dance2.png"),UIImage(named:"dance3.png"),UIImage(named:"dance4.png")];
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    @IBAction func clickButton(_ sender: Any) {
        myImageView.animationDuration = 1;
        myImageView.animationImages = imageArray;
        myImageView.animationRepeatCount = 3;
        myImageView.startAnimating();
    }
    
}

