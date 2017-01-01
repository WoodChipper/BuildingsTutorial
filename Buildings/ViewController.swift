//
//  ViewController.swift
//  Buildings
//
//  Created by Don Gordon on 1/1/17.
//  Copyright © 2017 DGsolutions. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("http://www.electronicarmory.com/projects/json/buildings.json")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

