//
//  third.swift
//  bookmycar1
//
//  Created by Jay on 2020-02-13.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

class third: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //creating outlet for view controls and assigning names
    @IBOutlet weak var tf_name: UITextField!
    //resigning keyboard after use
    @IBAction func dismissKeyboard(sender: UITapGestureRecognizer){
        tf_name.resignFirstResponder()
    }
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var picker_gender: UIPickerView!
    @IBOutlet weak var label_age: UILabel!
    @IBOutlet weak var switch_insurance: UISwitch!
    
    //creating variables and initializing it
    var pickerData:[String] = [String]()
    var name:String = ""
    var gender:String = ""
    var age:String=""
    var insurance:String=""
    var message:String=""
    
    //action creation for stepper control and using it to control age increase/decerease
    @IBAction func adder_age(_ sender: UIStepper) {
        label_age.text = Int(sender.value).description
    }
      
    //number of columns of data in pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //the number of rows data in pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    //the data to return for the row and component thats being passed in pickerview
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        gender = pickerData[row] //storing picker choice in gender variable
        return pickerData[row]
    }
   
    //action for on button click event
    @IBAction func submitBtnClicked(_ sender: Any) {
        
        //assigning values of text field name,age to respective variables
        name=tf_name.text!
        age=label_age.text!
        
        // switch case for incurance switch control
        if switch_insurance.isOn {
            insurance = "WITH car"
        } else {
            insurance = "WITHOUT car"
        }
        // message alert case for invalid name input
        if name==""{
            
        let alertController = UIAlertController(title: "Invalid Input", message:
            "Please enter name", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
        }
        // message string if data entered by user is valid
        else{
            message="Hello,\(name). We have confirmed your Booking. According to your input your Age is \(age) years, gender \(gender) and your booking is \(insurance) insurance "
            
            let alertController = UIAlertController(title: "Booking Submitted", message:
                message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.picker_gender.delegate = self
        self.picker_gender.dataSource = self
        //picker view data array
        pickerData = ["Male","Female"]
        //stepper functionality to set minimum and maximum value
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 100
        stepper.minimumValue = 16
    }
}
