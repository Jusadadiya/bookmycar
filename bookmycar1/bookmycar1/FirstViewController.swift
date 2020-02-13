//
//  FirstViewController.swift
//  bookmycar1
//
//  Created by Jay on 2020-02-12.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

let pics = ["Ferrari F12", "porsche_taycan_turbo_2019", "Mercedes_A220", "Volvo_S90"]
let maker = ["Ferrari", "Porsche", "Mercedes", "Volvo"]
let model = ["F12", "Taycan", "A220", "S90"]

var picscount = 0

class FirstViewController: UIViewController {

    @IBOutlet var tf_maker: UITextField!
    @IBOutlet var tf_model: UITextField!
    
    @IBOutlet var imgView: UIImageView!
    
    @IBAction func btnChanges(_ sender: UIButton) {
        imgView.image = UIImage(named: pics[picscount])
        tf_maker.text = maker[picscount]
        tf_model.text = model[picscount]
        picscount += 1
        if picscount > 3{
           picscount = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    



}

