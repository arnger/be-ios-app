//
// ViewController.swift
// Created by Lawrence.net
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.text = "customize label"
        
        //ch.05-4
        for _ in 1 ... 15 {
            myViewText.text = myViewText.text.appending("Morning");
        }
        var i = 0;
        while (i < 5){
            myViewText.text = myViewText.text.appending("A");
            i = i + 1;
        }
        i = 0;
        repeat{
            myViewText.text = myViewText.text.appending("B");
            i = i + 1;
        } while (i < 10);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var myLabel: UILabel!
    

    @IBOutlet
    weak var myBtn: UIButton!
    @IBAction
    func tapBtn(_ sender: Any) {
        myBtn.setTitle("Pressed", for: .normal)
    }
    //ch.05-2
    @IBOutlet
    weak var myHello1: UIButton!
    @IBAction
    func hello1Btn(_ sender: Any) {
        myLabel.text = myHello1.currentTitle;
    }
    @IBOutlet
    weak var myHello2: UIButton!
    @IBAction
    func hello2Btn(_ sender: Any) {
        myLabel.text = myHello2.currentTitle;
    }
    //ch.05-3
    @IBOutlet
    weak var myText: UITextField!
    @IBAction
    func inputText(_ sender: Any) {
        myLabel.text = myText.text;
   
   //for ch.05-p
        myResult.text = String(Int(myText.text!)! * Int(myVar2.text!)!);
    }
    //ch.05-p
    
    @IBOutlet
    weak var myVar2: UITextField!
    @IBAction
    func inputVar2(_ sender: Any) {
        myResult.text = String(Int(myText.text!)! * Int(myVar2.text!)!);
    }
    
    @IBOutlet
    weak var myResult: UITextField!
    //ch.05-4
    @IBOutlet
    weak var myViewText: UITextView!
    
    //ch.05-5
    @IBOutlet weak var mySwitch: UISwitch!
    @IBAction func changeSwitch(_ sender: Any) {
        if (mySwitch.isOn == true) {
            myLabel.text = "Yes";
            myBtn.isHidden = true;
            //myViewText is Editable
            myViewText.isEditable = true;
        } else {
            myLabel.text = "No";
            myBtn.isHidden = false;
            //myViewText is not Editable
            myViewText.isEditable = false;
        }
    }
    
    //ch.05-6
    @IBOutlet weak var mySlider: UISlider!
    @IBAction func changeSlider(_ sender: Any) {
        myLabel.text = String(mySlider.value);
        myViewText.font = UIFont.systemFont(ofSize: CGFloat(mySlider.value * 40));
    }
    
    //ch.05-7
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBAction func changeDatePicker(_ sender: Any) {
        let df = DateFormatter();
        df.dateFormat = "yyyy/MM/dd HH:mm:ss";
        myLabel.text = df.string(from: myDatePicker.date);
    }
    
    //ch.05-7p
    @IBAction func nowBtn(_ sender: Any) {
        myDatePicker.date = Date();
    }
    
    
}

