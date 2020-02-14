//
//  SecondViewController.swift
//  bookmycar1
//
//  Created by Jay on 2020-02-12.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var howManyDays: UITextField!
    
    @IBOutlet weak var howMuch: UITextField!
    
    @IBOutlet weak var startDate: UIDatePicker!
    
    @IBOutlet weak var endDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // when user change the start date picker
    @IBAction func startDateChanged(_ sender: UIDatePicker) {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: sender.date)
        let date2 = calendar.startOfDay(for: endDate.date)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        if components.day! < 0{
            howManyDays.text = "NA"
            howMuch.text = "NA"
        }else{
            howManyDays.text = "\(components.day! )"
            howMuch.text = "\(components.day! * 100)"
        }
    }
    
    
    @IBAction func endDateChanged(_ sender: UIDatePicker) {
        //let dateFormatter = DateFormatter()
        
        //dateFormatter.dateStyle = DateFormatter.Style.long
        //dateFormatter.timeStyle = DateFormatter.Style.long
        
        //let endDateString = dateFormatter.string(from: sender.date)
        //let startDateString = dateFormatter.string(from: startDate.date)
        
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: startDate.date)
        let date2 = calendar.startOfDay(for: sender.date)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        if components.day! < 0{
            howManyDays.text = "NA"
            howMuch.text = "NA"
        }else{
            howManyDays.text = "\(components.day! )"
            howMuch.text = "\(components.day! * 100)"
        }
    }
}

