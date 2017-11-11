//
//  ViewController.swift
//  ch10-02
//
//  Created by NTUBIMD on 2017/11/11.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.delegate = self;
        myTableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myTableView: UITableView!
    
    var Array1 = ["Hello1","Hello2"]
    var Array2 = ["World1","World2","World3"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return Array1.count
        } else {
            return Array2.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Array1"
        } else {
            return "Array2"
        }
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "myCell") as UITableViewCell?)!
        
        if indexPath.section == 0 {
            cell.textLabel!.text = Array1[indexPath.row]
        } else {
            cell.textLabel!.text = Array2[indexPath.row]
        }
        
        return cell
    }
}

