//
//  ViewController.swift
//  ch06-7
//
//  Created by NTUBIMD on 2017/10/28.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlay = AVAudioPlayer()
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = Bundle.main.path(forResource: "music", ofType: "mp3");
        let alarmSound = URL(fileURLWithPath: audioPath!);
        do {
            audioPlay = try AVAudioPlayer(contentsOf: alarmSound);
            audioPlay.prepareToPlay();
            audioPlay.play();
        } catch {print("Error");}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        // Dispose of any resources that can be recreated.
    
    }
    @IBOutlet weak var myStartButton: UIButton!
    @IBOutlet weak var myPauseButton: UIButton!
    @IBOutlet weak var myStopButton: UIButton!
    @IBOutlet weak var mySlider: UISlider!
    
    @IBAction func tapStartButton(_ sender: Any) {
        
    }
    
    @IBAction func tapPauseButton(_ sender: Any) {
    }
    
    @IBAction func tapStopButton(_ sender: Any) {
    }
}

