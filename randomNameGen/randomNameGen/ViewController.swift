//
//  ViewController.swift
//  randomNameGen
//
//  Created by Michael Elbaz on 11/18/15.
//  Copyright © 2015 elboss-apps. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet weak var addButtonTapped: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ArrayController.sharedInstance.people.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let currentPerson = ArrayController.sharedInstance.people[indexPath.row]
        
        cell.textLabel?.text = currentPerson.name
        cell.detailTextLabel?.text = "Pair: \(currentPerson.pairNumber)"
        
        return cell
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let currentPerson = ArrayController.sharedInstance.people[indexPath.row]
            ArrayController.sharedInstance.removePerson(currentPerson)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    
    @IBAction func mixMe(sender: AnyObject) {
        ArrayController.sharedInstance.randomizePairs()
        tableView.reloadData()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editPerson" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let person = ArrayController.sharedInstance.people[indexPath.row]
                
                let detailScene = segue.destinationViewController as! AddNewController
                
                _ = detailScene.view
                detailScene.person = person
                detailScene.updateButtonTitle()
                detailScene.updateWithPerson(person)
            }
        }
    }


}

