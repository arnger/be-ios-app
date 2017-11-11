//
//  ViewController.swift
//  ch10-03
//
//  Created by NTUBIMD on 2017/11/11.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "myCell") as UITableViewCell?)!
        
        let myLabel: UILabel = cell.viewWithTag(1) as! UILabel
        let mySwitch: UISwitch = cell.viewWithTag(2) as! UISwitch
        
        if indexPath.row == 0 {
            myLabel.text = "ON"
            mySwitch.isOn = true
        }
        else {
            myLabel.text = "OFF"
            mySwitch.isOn = false
        }
        
        return cell
    }
}

