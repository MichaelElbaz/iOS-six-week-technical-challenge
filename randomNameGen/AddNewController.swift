//
//  AddNewController.swift
//  randomNameGen
//
//  Created by Michael Elbaz on 11/18/15.
//  Copyright © 2015 elboss-apps. All rights reserved.
//

import UIKit

class AddNewController: UIViewController {
    

    var person: ArrayView?
    
    @IBOutlet weak var addPerson: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func addButton(sender: AnyObject) {
        if let name = self.nameTextField.text {
            if let oldPerson = self.person {
                ArrayController.sharedInstance.removePerson(oldPerson)
            }
            let newPerson = ArrayView(name: name)
            ArrayController.sharedInstance.addPerson(newPerson)
            self.navigationController?.popToRootViewControllerAnimated(true)
        }

        
    }
   
    func updateWithPerson(person: ArrayView) {
        self.nameTextField.text = person.name
    }
    
    override func viewDidAppear(animated: Bool) {
        if self.person != nil {
            self.addPerson.setTitle("Updated name ", forState: .Normal)
        } else {
            self.addPerson.setTitle("Added Name", forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func updateButtonTitle() {
        if self.person != nil {
            self.addPerson.setTitle("Updated Name", forState: .Normal)
        } else {
            self.addPerson.setTitle("Added Name", forState: .Normal)
        }
    }
    

    
}