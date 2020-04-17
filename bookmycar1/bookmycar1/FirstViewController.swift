//
//  FirstViewController.swift
//  bookmycar1
//
//  Created by Jay on 2020-02-12.
//  Copyright © 2020 Jay. All rights reserved.
//

import UIKit
import CoreData

// List of pics used to display in the image view
let pics = ["Ferrari F12",
            "porsche_taycan_turbo_2019",
            "Mercedes_A220", "Volvo_S90"]

// List of makers to associate to each pic
let maker = ["Ferrari",
             "Porsche",
             "Mercedes",
             "Volvo"]

// List of models to associate to each pic
let model = ["F12",
             "Taycan",
             "A220",
             "S90"]


// Initialized pic counter to get photo and details
// Starts in 1 to skip the first car on the list because
// when the app starts, the first car is display automatically.
var picscount = 2
var message:String=""
let preferredLanguage = NSLocale.preferredLanguages[0]
var messageBody = ""
var cancelMsg = ""


func createData(){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let userEntity = NSEntityDescription.entity(forEntityName: "Car", in: managedContext)!
    
    // add some data
    for i in 0...3 {
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user.setValue(maker[i], forKeyPath: "maker")
        user.setValue(model[i], forKeyPath: "model")
    }
    
    do {
        try managedContext.save()
    } catch let error as NSError{
        print("Couldn't save. \(error), \(error.userInfo)")
    }
    
}


class FirstViewController: UIViewController {

    // tf_maker shows the car maker related to the photo displayed
    @IBOutlet var tf_maker: UITextField!
    // tf_model shows the car model related to the photo displayed
    @IBOutlet var tf_model: UITextField!
    
    // imgView shows car photos
    @IBOutlet var imgView: UIImageView!
    
    // btnChanges action change the imgView with a new photo every time
    // the user clicks the button
    @IBAction func btnChanges(_ sender: UIButton) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            
        let managedContext = appDelegate.persistentContainer.viewContext
            
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Car")
            
        do {
                let result = try managedContext.fetch(fetchRequest)
                let results = result as! [NSManagedObject]
                // read values from core data
                tf_maker.text = results[picscount].value(forKeyPath: "maker") as? String
                tf_model.text = results[picscount].value(forKeyPath: "model") as? String
        }
        catch {
                print("Failed")
        }
        
        imgView.image = UIImage(named: pics[picscount])
        //tf_maker.text = maker[picscount]
        //tf_model.text = model[picscount]
        
        // move in 1 all the array pointers
        picscount += 1
        // if it is the end of the arrays,
        // it would restart the picscount counter to zero
        if picscount > pics.count - 1{
           picscount = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //enable interaction with image view
        imgView.isUserInteractionEnabled = true
        //add an interaction to the menu view so the system knows to show a menu when the view is pressed.
        let interaction = UIContextMenuInteraction (delegate: self)
        imgView.addInteraction(interaction)
        
        createData()
    }
}

//an extension to our view controller for that protocol:
extension FirstViewController : UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
       return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
                //here implement share action
            let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
                if preferredLanguage == "en" {
                    messageBody = "Share the picture of your next booking with your friends!"
                    cancelMsg = "OK"
                }else if preferredLanguage == "zh-Hans" {
                    messageBody = "与朋友分享您下次预订的照片！"
                    cancelMsg = "好"
                }else if preferredLanguage == "es-419" {
                    messageBody = "Comparte la foto de tu proximo carro a rentar con tus amigos!"
                    cancelMsg = "OKAY"
                }
                let alertController = UIAlertController(title: messageBody, message:
                    message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: cancelMsg, style: .default))
                self.present(alertController, animated: true, completion: nil)
        }
               // Create and return a UIMenu with all of the actions as children
               return UIMenu(title: "", children: [share])
           }
    }
}
