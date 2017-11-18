//
//  DetailViewController.swift
//  ch10-06
//
//  Created by NTUBIMD on 2017/11/18.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        self.t01.text = self.detailItem?.object(forKey: "SiteName") as! NSString as String
        self.t02.text = self.detailItem?.object(forKey: "County") as! NSString as String
        self.t03.text = self.detailItem?.object(forKey: "AQI") as! NSString as String
        self.t04.text = self.detailItem?.object(forKey: "MajorPollutant") as! NSString as String
        self.t05.text = self.detailItem?.object(forKey: "Status") as! NSString as String
        self.t06.text = self.detailItem?.object(forKey: "SO2") as! NSString as String
        self.t07.text = self.detailItem?.object(forKey: "CO") as! NSString as String
        self.t08.text = self.detailItem?.object(forKey: "O3") as! NSString as String
        self.t09.text = self.detailItem?.object(forKey: "PM10") as! NSString as String
        self.t10.text = self.detailItem?.object(forKey: "PM2.5") as! NSString as String
        self.t11.text = self.detailItem?.object(forKey: "NO2") as! NSString as String
        self.t12.text = self.detailItem?.object(forKey: "WindSpeed") as! NSString as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDictionary? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    @IBOutlet weak var t01: UITextField!
    @IBOutlet weak var t02: UITextField!
    @IBOutlet weak var t03: UITextField!
    @IBOutlet weak var t04: UITextField!
    @IBOutlet weak var t05: UITextField!
    @IBOutlet weak var t06: UITextField!
    @IBOutlet weak var t07: UITextField!
    @IBOutlet weak var t08: UITextField!
    @IBOutlet weak var t09: UITextField!
    @IBOutlet weak var t10: UITextField!
    @IBOutlet weak var t11: UITextField!
    @IBOutlet weak var t12: UITextField!

}

