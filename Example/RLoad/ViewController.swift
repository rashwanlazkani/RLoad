//
//  ViewController.swift
//  RLoad
//
//  Created by rashwanlazkani on 10/30/2018.
//  Copyright (c) 2018 rashwanlazkani. All rights reserved.
//

import RLoad
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rload = RLoadIndicator()
        rload.create(x: view.frame.midX - 50, y: view.frame.midY - 50, radius: 50, begin: true)
        view.addSubview(rload)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

