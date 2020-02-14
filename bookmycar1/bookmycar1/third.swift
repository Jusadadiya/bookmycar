//
//  third.swift
//  bookmycar1
//
//  Created by Jay on 2020-02-13.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

class third: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
     @IBOutlet weak var tf_name: UITextField!
      
       @IBOutlet weak var stepper: UIStepper!
       @IBOutlet weak var picker_gender: UIPickerView!
       var pickerData:[String] = [String]()
       
       var name:String = ""
       var gender:String = ""
       @IBOutlet weak var label_age: UILabel!
       
       var age:String=""
       var insurance:String=""
       @IBAction func adder_age(_ sender: UIStepper) {
           label_age.text = Int(sender.value).description
       }
      
    @IBOutlet weak var switch_insurance: UISwitch!
    
       var message:String=""
    //number of columns of data
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //the number of rows data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    //the data to return for the row and component thats being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        gender = pickerData[row]
        return pickerData[row]
    }
   
    @IBAction func submitBtnClicked(_ sender: Any) {
        name=tf_name.text!
        age=label_age.text!
        
        if switch_insurance.isOn {
            insurance = "with car"
        } else {
            insurance = "without car"
        }
        if name==""
        {
        let alertController = UIAlertController(title: "iOScreator", message:
            "Please enter name", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
        }else {
            message="Hello,\(name). We have received your information as follows. Your Age is \(age) years and gender \(gender) and \(insurance) insurance "
            let alertController = UIAlertController(title: "iOScreator", message:
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
        
        pickerData = ["Male","Female"]
        stepper.wraps = true
        stepper.autorepeat = false
        stepper.maximumValue = 100
        stepper.minimumValue = 16
        
    }
    
}
