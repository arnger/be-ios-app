//
//  ViewController.swift
//  ch05-9
//
//  Created by NTUBIMD on 2017/10/28.
//  Copyright © 2017年 NTUBIMD. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    let year = ["2010","2011","2012","2013","2014","2015","2016","2017"];
    var whatYear = "2017";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myPickerView.dataSource = self;
        myPickerView.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
      
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return year.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return year[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        whatYear = year[row];
        myLabel.text = "you choice \(whatYear)";
    }
    
   
}

