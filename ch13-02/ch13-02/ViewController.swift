//
//  ViewController.swift
//  ch13-02
//
//  Created by NTUBIMD on 2017/11/18.
//  Copyright © 2017年 business-engineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {

    var dataArray =
        ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var monthArray =
         ["1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png","10.png","11.png","12.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let acell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! Cell
        acell.myCell.text = dataArray[indexPath.row]
        //acell.myim.image = UIImage(named: monthArray[indexPath.row])
        acell.myImage.image = UIImage(named: monthArray[indexPath.row])
        return acell
        
    }

    @IBOutlet weak var myCollectionView: UICollectionView!
    
        
}

