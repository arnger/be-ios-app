//
//  ViewController.swift
//  ch10-07
//
//  Created by NTUBIMD on 2017/11/18.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    let citiesArray = [
        "T臺北市","新北市","桃園市","臺中市","臺南市",
        "⾼雄市","基隆市","新⽵市","嘉義市","新⽵縣",
        "苗栗縣","彰化縣","南投縣","Y雲林縣","嘉義縣",
        "屏東縣","宜蘭縣","花蓮縣","T臺東縣","澎湖縣",
        "⾦⾨縣","連江縣"]
    
    var searchArray : [String] = []
    var showSearchResults = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.delegate = self
        myTableView.dataSource = self
        mySearchBar.delegate = self

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange
        searchText: String) {
        searchArray = citiesArray.filter( { (city) -> Bool in
            let cityText:NSString = city as NSString
            let range = cityText.range(of: searchText, options:
                NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
            
        })
        if(searchArray.count == 0) {
            showSearchResults = false
        } else {
            showSearchResults = true
        }
        // Reload the tableview.
        myTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showSearchResults {
            return searchArray.count
        }
        else {
            return self.citiesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier:
            "myCell", for: indexPath)
        if showSearchResults {
            cell.textLabel?.text = searchArray[indexPath.row]
        }
        else {
            cell.textLabel?.text = self.citiesArray[indexPath.row]
        }
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBOutlet weak var myTableView: UITableView!

    @IBOutlet weak var mySearchBar: UISearchBar!
    
}

