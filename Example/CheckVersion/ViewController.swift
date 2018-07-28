//
//  ViewController.swift
//  CheckVersion
//
//  Created by andoma93 on 07/27/2018.
//  Copyright (c) 2018 andoma93. All rights reserved.
//

import UIKit
import CheckVersion

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CheckVersion.checkWithAlert(viewController: self){ result in
            //check result and do what you want
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

