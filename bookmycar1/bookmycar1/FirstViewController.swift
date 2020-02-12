//
//  FirstViewController.swift
//  bookmycar1
//
//  Created by Jay on 2020-02-12.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

var lb_i1: UILabel!

class FirstViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBAction func btnChanges(_ sender: UIButton) {
        imgView.image = UIImage(named: "Mercedez_Benz")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    



}

