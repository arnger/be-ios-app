//
//  ViewController.swift
//  ch08-04
//
//  Created by NTUBIMD on 2017/11/4.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

struct webJson {
    let ID: Int
    let Name: String
    let webUrl: String
}


class ViewController: UIViewController {
    var webJsons = [webJson]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myPath = Bundle.main.path(forResource: "data", ofType: "json")
        let myUrlPath = URL(fileURLWithPath: myPath!)
        let myData = try? Data(contentsOf: myUrlPath)
        do {
            //let jsonArray = try? JSONDecoder().decode([myData].self, from: myData!)
            let jsonArray = try? JSONSerialization.jsonObject(with: myData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            for result in jsonArray! {
                let name = (result as AnyObject).value(forKey: "Name") as! String
                let weburl = (result as AnyObject).value(forKey: "webUrl") as! String
                myTextView.text = myTextView.text + "Name=\(name)\nweburl=\(weburl)\n\n"
            }
        }
        
        let jsonUrl = URL(string: "http://120.97.29.33/1.json")
        let myData1 = try? Data(contentsOf: jsonUrl!)
        do {
            webJsons = try! JSONDecoder().decode([webJson].self, from: myData1!)
            for rs in webJsons {
                myTextView1.text = myTextView1.text + "name=\(rs.Name)\nwebUrl=\(rs.webUrl)\n\n"
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var myTextView: UITextView!
      @IBOutlet var myTextView1: UITextView!
    
}

