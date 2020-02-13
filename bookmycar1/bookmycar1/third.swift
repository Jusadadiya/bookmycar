//
//  third.swift
//  bookmycar1
//
//  Created by Jay on 2020-02-13.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit

class third: UIViewController  ,UITextFieldDelegate {

    @IBOutlet weak var tf_name: UITextField!
   
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var picker_gender: UIPickerView!
    var name:String = ""
    
    @IBOutlet weak var label_age: UILabel!
    
    var age:String=""
    @IBAction func adder_age(_ sender: UIStepper) {
        label_age.text = Int(sender.value).description
    }
   
    @IBAction func switch_insurance(_ sender: Any) {
    }
    var message:String=""
    @IBAction func submitBtnClicked(_ sender: Any) {
        name=tf_name.text!
        age=label_age.text!
        if name==""
        {
        let alertController = UIAlertController(title: "iOScreator", message:
            "Please enter name", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
        }else {
            message="Hello,\(name). We have received your information as follows. Your Age is \(age) years "
            let alertController = UIAlertController(title: "iOScreator", message:
                message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 100
        stepper.minimumValue = 16
    }


}
