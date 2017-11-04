//
//  ViewController.swift
//  ch07-02
//
//  Created by NTUBIMD on 2017/11/4.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit
import CoreMotion;

class ViewController: UIViewController {
let motionManager: CMMotionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager.accelerometerUpdateInterval = 0.2
        
            motionManager.startAccelerometerUpdates(to: OperationQueue.main,
                                                    withHandler: { (data, error) in
                                                        //輸出數值
                self.x1.text = String(format: "%.2f", data!.acceleration.x)
                self.y1.text = String(format: "%.2f", data!.acceleration.y)
                self.z1.text = String(format: "%.2f", data!.acceleration.z)
            })
        
            //陀螺儀 讀取 ＸＹＺ軸的旋轉狀況
            motionManager.startGyroUpdates(to: OperationQueue.main, withHandler: { (data,
            error) in
                self.x2.text = String(format: "%.2f", data!.rotationRate.x)
                self.y2.text = String(format: "%.2f", data!.rotationRate.y)
                self.z2.text = String(format: "%.2f", data!.rotationRate.z)
            })

            //磁力儀 讀取 ＸＹＺ軸的磁感應強度
            motionManager.startMagnetometerUpdates(to: OperationQueue.main,
            withHandler: { (data, error) in
                self.x3.text = String(format: "%.2f", data!.magneticField.x)
                self.y3.text = String(format: "%.2f", data!.magneticField.y)
                self.z3.text = String(format: "%.2f", data!.magneticField.z)
            })
        
            //裝置移動 讀取 Pitch Roll Yaw
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main,
            withHandler: { (data, error) in
                self.x4.text = String(format: "%.2f", data!.attitude.pitch)
                self.y4.text = String(format: "%.2f", data!.attitude.roll)
                self.z4.text = String(format: "%.2f", data!.attitude.yaw)
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var x1: UITextField!
    @IBOutlet weak var y1: UITextField!
    @IBOutlet weak var z1: UITextField!
    
    @IBOutlet weak var x2: UITextField!
    @IBOutlet weak var y2: UITextField!
    @IBOutlet weak var z2: UITextField!
    
    @IBOutlet weak var x3: UITextField!
    @IBOutlet weak var y3: UITextField!
    @IBOutlet weak var z3: UITextField!
    
    @IBOutlet weak var x4: UITextField!
    @IBOutlet weak var y4: UITextField!
    @IBOutlet weak var z4: UITextField!
    
}

