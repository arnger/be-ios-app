//
//  ViewController.swift
//  ch07-03
//
//  Created by NTUBIMD on 2017/11/4.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var LatitudeGPS = ""
    var LongitudeGPS = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //讓位置感應器的作用於主程式上
        self.locationManager.delegate = self
        //設定精細度為最高
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //設定多遠的距離才更新位置資訊，目前設定為一移動就更新
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        //獲得手機權限
        self.locationManager.requestWhenInUseAuthorization()
        //開始執行取得位置資訊
        self.locationManager.startUpdatingLocation()
        //開始執行取得方向資訊
        self.locationManager.startUpdatingHeading()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){
        
        LatitudeGPS = String(format: "%.6f",
                             manager.location!.coordinate.latitude) as String
        LongitudeGPS = String(format: "%.6f",
                              manager.location!.coordinate.longitude) as String
        latitude.text = String( LatitudeGPS )
        longitude.text = String( LongitudeGPS )
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.myImageView.transform=CGAffineTransform.identity;
        let degree = -1 * manager.heading!.magneticHeading * Double.pi / 100
        self.myImageView.transform = CGAffineTransform(rotationAngle: CGFloat(degree))
    }
}

