//
//  MasterViewController.swift
//  ch10-06
//
//  Created by NTUBIMD on 2017/11/18.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        let myURL = URL(string:
            "http://opendata2.epa.gov.tw/AQI.json")
        let jsonData = try? Data( contentsOf: myURL!)
        do {
            self.objects = try! JSONSerialization.jsonObject(with:
                jsonData!, options:
                JSONSerialization.ReadingOptions.mutableContainers ) as! [AnyObject]
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row] as! NSDate
                let object = objects[indexPath.row] as! NSDictionary
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController  
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        /*
        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
        */
        let object = objects[indexPath.row] as! NSDictionary
        let myLabel1 : UILabel = cell.viewWithTag(1) as! UILabel
        let myLabel2 : UILabel = cell.viewWithTag(2) as! UILabel
        let myLabel3 : UILabel = cell.viewWithTag(3) as! UILabel
        myLabel1.text = object.object(forKey: "County") as! NSString as String
        myLabel2.text = object.object(forKey: "SiteName") as! NSString as String
        myLabel3.text = object.object(forKey: "AQI") as! NSString as String
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

