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
var picscount = 1



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
        imgView.image = UIImage(named: pics[picscount])
        tf_maker.text = maker[picscount]
        tf_model.text = model[picscount]
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
    }
}

//an extension to our view controller for that protocol:
extension FirstViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
       return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
                //here implement share action
            let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
                   // Show system share sheet
                    print("Sharing")
        }
               // Here implemet delete action
            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash")) { action in
                   // Perform delete
                    print("Deleting")
                
        }
               // Create and return a UIMenu with all of the actions as children
               return UIMenu(title: "", children: [share, delete])
           }
    }
}
