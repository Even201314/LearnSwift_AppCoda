//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by vince.yu on 5/5/16.
//  Copyright © 2016年 Even. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats","Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                destinationController.restaurantImage = "restaurant.jpg"
                destinationController.restaurantName = restaurantNames[indexPath.row]
                destinationController.restautantType  = restaurantTypes[indexPath.row]
                destinationController.restaurantLocation = restaurantLocations[indexPath.row]
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.locationLabel?.text = restaurantLocations[indexPath.row]
        cell.typeLabel?.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: "restaurant.jpg")
        
//        cell.thumbnailImageView.layer.cornerRadius = 30.0
//        cell.thumbnailImageView.clipsToBounds = true
        
//        if restaurantIsVisited[indexPath.row]{
//            cell.accessoryType = .Checkmark
//        }else{
//            cell.accessoryType = .None
//        }
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //create an opiton menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        
        //Add action to the menu
        let cancelAction = UIAlertAction(title: "Cacel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let callActionHandler = {(action: UIAlertAction) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {(action: UIAlertAction) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            self.restaurantIsVisited[indexPath.row] = true
        })
        optionMenu.addAction(isVisitedAction)
        
        let isNotVisitedAction = UIAlertAction(title: "I've not been here", style: .Default, handler: {(action: UIAlertAction) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .None
            self.restaurantIsVisited[indexPath.row] = false
        })
        optionMenu.addAction(isNotVisitedAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            restaurantNames.removeAtIndex(indexPath.row)
            restaurantLocations.removeAtIndex(indexPath.row)
            restaurantTypes.removeAtIndex(indexPath.row)
            restaurantIsVisited.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        //Social Sharing Button
        let shareAction = UITableViewRowAction(style: .Default, title: "Share", handler: {(action, indexPath) -> Void in
            let defaultText  = "Just checking in at " + self.restaurantNames[indexPath.row]
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.presentViewController(activityController, animated: true, completion: nil)
        })
        
        //Delete Button
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: {(action, indexPath) -> Void in
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        shareAction.backgroundColor = UIColor(red:  28.0 / 255.0, green: 165.0 / 255.0, blue: 253.0 / 255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0 / 255.0, green: 202.0 / 255.0, blue: 203.0 / 255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
