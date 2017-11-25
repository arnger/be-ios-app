//
//  ViewController.swift
//  ch12-05
//
//  Created by NTUBIMD on 2017/11/25.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit
import SQLite;

class ViewController: UIViewController {
    let userdata = Table("userdata")
    let iid = Expression<String>("iid")
    let cname = Expression<String>("cname")
    //let src:String = Bundle.main.path(forResource: "mydb", ofType: "sqlite")!
    let db = try! Connection( Bundle.main.path(forResource: "mydb", ofType: "sqlite")! )
    
    @IBOutlet weak var myiid :UITextField!
    @IBOutlet weak var mycname :UITextField!
    @IBOutlet weak var mystatus :UILabel!
    
    @IBAction func insertData(sender:Any){
        do {
            let insertData = userdata.insert(iid <- myiid.text!, cname <- mycname.text!)
            try db.run(insertData)
            mystatus.text = "insert iid: \(myiid.text!)"
        } catch {
            mystatus.text = "insert failed: \(error)"
        }
    }
    
    @IBAction func updateData(sender:Any){
        do {
            let updateData = userdata.filter(iid == myiid.text!)
            try db.run(updateData.update(cname <- mycname.text!))
            mystatus.text = "update success: \(myiid.text!)"
        } catch {
            mystatus.text = "update failed: \(error)"
        }
    }
    
    @IBAction func deleteData(sender:Any){
        do {
            let delData = userdata.filter(iid == myiid.text!)
            try db.run(delData.delete())
            mystatus.text = "delete iid: \(myiid.text!)"
        } catch {
            mystatus.text = "delete failed: \(error)"
        }
    }
    
    @IBAction func selectData(sender:Any){
        do {
            let selectData = userdata.filter(iid == myiid.text!).select(iid, cname)
            for userdata in try db.prepare(selectData) {
                myiid.text = userdata[iid]
                mycname.text = userdata[cname]
            }
            mystatus.text = "select success"
        } catch {
            mystatus.text = "select failed: \(error)"
        }
        //測試用
        for userdata in try! db.prepare(userdata) {
            print("iid: \(userdata[iid]), cname: \(userdata[cname])")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

