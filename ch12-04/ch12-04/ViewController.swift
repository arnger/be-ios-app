//
//  ViewController.swift
//  ch12-04
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
        loadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData(){
        let path:String = Bundle.main.path(forResource: "mydb", ofType:
            "sqlite")!
        var isDatabaseExist:Bool = false
        let fileManager:FileManager = FileManager.default
        isDatabaseExist = fileManager.fileExists(atPath: path)
        let databaseStatus:String = isDatabaseExist ? "已存在(直接使用)" : "不存在(重新建立)"
        print("資料庫\(databaseStatus)")
        
        //執行 CREATE 跟 INSERT。
        if isDatabaseExist {
            //初始化資料庫
            let database = FMDatabase(path: path)
            //開啟資料庫
            if !database.open() {
                print("Unable to open database")
                return
            }
            //TABLE: userdata - 建立資料表
            do{
                try database.executeUpdate("create table if not exists userdata  (iid text primary key, cname text);", values: nil)
            } catch{
                print("create table failed: \(database.lastErrorMessage())")
            }
            //TABLE: userdata - 插入新資料
            do{
                try database.executeUpdate("insert into userdata (iid, cname) values ('005','peter');", values: nil)
            } catch{
                print("insert table failed: \(database.lastErrorMessage())")
            }
            //TABLE: userdata - 查詢資料
            if let fmResult = database.executeQuery("select * from userdata;", withArgumentsIn: []) {
                while fmResult.next() {
                    let iid = fmResult.string(forColumn: "iid")!
                    let cname = fmResult.string(forColumn: "cname")!
                    myTextView.text = myTextView.text + "iid=\(iid)\n"
                    myTextView.text = myTextView.text + "cname=\(cname)\n\n"
                }
            }
            //關閉資料庫
            database.close()
        }
        
    }
    
    @IBOutlet weak var myTextView:UITextView!

}

