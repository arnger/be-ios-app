//
//  ViewController.swift
//  ch12-03
//
//  Created by NTUBIMD on 2017/11/25.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myButton:UIButton!
    @IBAction func tapBtn(_ sender: Any) {
        myTextView.text = ""
        
        var db:OpaquePointer? = nil
        
        let src:String = Bundle.main.path(forResource: "mydb",
                                          ofType: "sqlite")!
        
        if (sqlite3_open(src, &db) == SQLITE_OK){
            
            if (db != nil) {
                let sqlString = "SELECT * FROM userdata"
                
                // statement ⽤來儲存執⾏結果
                var statement : OpaquePointer? = nil
                if sqlite3_prepare_v2(db, sqlString, -1,&statement, nil) != SQLITE_OK {
                    let errmsg = String(cString: sqlite3_errmsg(db))
                    print("error preparing query: \(errmsg)")
                }
                
                //利⽤迴圈取出查詢結果
                while (sqlite3_step(statement) == SQLITE_ROW)
                {
                    let iid =
                        Int(sqlite3_column_int(statement, 0))
                    let name = String(cString:
                        sqlite3_column_text(statement, 1))
                    myTextView.text = myTextView.text +
                    "iid=\(iid)\n"
                    myTextView.text = myTextView.text +
                    "name=\(name)\n\n"
                }
                //使⽤完畢 釋放statement
                sqlite3_finalize(statement);
            }
            sqlite3_close(db);
            
        } else {
            let alertController = UIAlertController (title: "開啟失敗", message: "無法開啟資料庫", preferredStyle: .alert)
                present(alertController, animated: true, completion: nil)
                exit(1)
        }
    }
    
}

