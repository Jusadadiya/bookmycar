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
    @IBOutlet weak var tf_age: UITextField!
    @IBOutlet weak var picker_gender: UIPickerView!
    var name:String = ""
    var age:String=""
    @IBAction func adder_age(_ sender: Any) {
    }
   
    @IBAction func switch_insurance(_ sender: Any) {
    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        name=tf_name.text!
        age=tf_age.text!
        let alertController = UIAlertController(title: "iOScreator", message:
            name, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
