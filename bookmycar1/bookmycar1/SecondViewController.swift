//
//  SecondViewController.swift
//  bookmycar1
//
//  Created by Jay on 2020-02-12.
//  Copyright © 2020 Wen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // the text field used to show how many days of rental
    @IBOutlet weak var howManyDays: UITextField!
    // the text field used to show hou much of the rental
    @IBOutlet weak var howMuch: UITextField!
    // the first datepicker used to get the start date
    @IBOutlet weak var startDate: UIDatePicker!
    // the second datepicker used to get the end date
    @IBOutlet weak var endDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // when user changes the start date picker
    @IBAction func startDateChanged(_ sender: UIDatePicker) {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: sender.date)
        let date2 = calendar.startOfDay(for: endDate.date)
        // calculate how many days between the two dates
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        // error handling
        if components.day! < 0{
            howManyDays.text = "NA"
            howMuch.text = "NA"
        }else{
            howManyDays.text = "\(components.day! )"
            // $100 per day
            howMuch.text = "\(components.day! * 100)"
        }
    }
    
    // when user changes the end date picker
    @IBAction func endDateChanged(_ sender: UIDatePicker) {
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateStyle = DateFormatter.Style.long
        //dateFormatter.timeStyle = DateFormatter.Style.long
        //let endDateString = dateFormatter.string(from: sender.date)
        //let startDateString = dateFormatter.string(from: startDate.date)
        
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: startDate.date)
        let date2 = calendar.startOfDay(for: sender.date)
        // calculate how many days between the two dates
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        // error handling
        if components.day! < 0{
            howManyDays.text = "NA"
            howMuch.text = "NA"
        }else{
            howManyDays.text = "\(components.day! )"
            // $100 per day
            howMuch.text = "\(components.day! * 100)"
        }
    }
}

