//
//  ListController.swift
//  bookmycar1
//
//  Created by william reyes on 2020-03-19.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

class ListController: UIViewController{
    
    @IBOutlet var lbtitle: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var lbdoors: UILabel!
    @IBOutlet var lbfuel: UILabel!
    @IBOutlet var lbspeed: UILabel!
    
    @IBOutlet var txtseats: UITextField!
    @IBOutlet var txtdoors: UITextField!
    @IBOutlet var txtfuel: UITextField!
    @IBOutlet var txtspeed: UITextField!
    
    
    
    override func viewDidLoad() {
        lbtitle.text = vehicle[myIndex]
        txtseats.text = seats[myIndex]
        txtdoors.text = doors[myIndex]
        txtfuel.text = fuel[myIndex]
        txtspeed.text = speed[myIndex]
    }
}
