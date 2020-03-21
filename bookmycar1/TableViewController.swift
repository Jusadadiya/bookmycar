//
//  TableViewController.swift
//  bookmycar1
//
//  Created by william reyes on 2020-03-19.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

// List of vehicles
var vehicle = ["Ferrari F12",
               "porsche taycan turbo 2019",
               "Mercedes A220",
               "Volvo S90"]

// list of characteristics of vehicles
var seats = ["4", "4", "5", "5"]
var doors = ["2", "4", "4", "4"]
var fuel = ["22.9 l/100 km", "Electric", "6.8 l/100 km", "10.8 l/100 km"]
var speed = ["340 km/h", "259 km/h", "235 km/h", "230 km/h"]

var myIndex = 0

class TableViewController: UITableViewController {

    //when one of the elements from the table view is selected and the segue keep the index path
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}
