//
//  ViewController.swift
//  ch06-4
//
//  Created by NTUBIMD on 2017/10/28.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.text = "Hello World.";
       // myLabel.isHidden = true;
      // myImage.image = #imageLiteral(resourceName: "ball.png");
        Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(moveImage), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    var down = true;
    var right = true;
    
    @objc func moveImage(){
        var wx,wy : CGFloat;
        wx = myImage.center.x;
        wy = myImage.center.y;
        if (wx > 340 && right) {
            right = false;
        }
        if (wx < 30 && !right){
            right = true;
        }
        if (right){wx+=10}else{wx-=10}
        if(wy > 640 && down){
            down = false;
        }
        if (wy < 30 && !down){
            down = true;
        }
        if (down){wy+=10 }else{wy-=10}
   
        myImage.center = CGPoint(x: wx, y: wy);
        
   }
 
    @objc func moveLabel(){
        var wx,wy : CGFloat;
        wx = myLabel.center.x;
        wy = myLabel.center.y;
        wx += 10;
        if (320 < wx){
            wx = 0;
        }
        wy += 5
        if (480 < wy){
            wy = 0;
        }
        myLabel.center = CGPoint(x: wx, y: wy);
    }

}

