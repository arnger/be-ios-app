//
//  DetailViewController.swift
//  ch10-05
//
//  Created by NTUBIMD on 2017/11/11.
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
        myName.text = self.detailItem?.object(forKey: "name") as? String
        myAge.text = String ( self.detailItem?.object(forKey: "age") as! Int )
        myGender.text = self.detailItem?.object(forKey: "gender") as? String
        myPhone.text = self.detailItem?.object(forKey: "phone") as? String
        myAddress.text = self.detailItem?.object(forKey: "address") as? String
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

    @IBOutlet weak var myName: UITextField!
    @IBOutlet weak var myAge: UITextField!
    @IBOutlet weak var myGender: UITextField!
    @IBOutlet weak var myPhone: UITextField!
    @IBOutlet weak var myAddress: UITextField!
    
}

