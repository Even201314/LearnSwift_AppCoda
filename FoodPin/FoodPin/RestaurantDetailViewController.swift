//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Even201314 on 16/5/10.
//  Copyright © 2016年 Even. All rights reserved.
//

import UIKit

protocol UpdateRestaurant {
    func updateRating(rating: String, restaurantAtIndex: Int)
}

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ratingButton: UIButton!
    
    var restaurant: Restaurant!
    var restaurantIndex: Int = 0
    var updateRestaurant: UpdateRestaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = restaurant.name
        
        restaurantImageView.image = UIImage(named: restaurant.image)
        tableView.backgroundColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 0.2)
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.separatorColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 0.8)
        
        ratingButton.setImage(UIImage(named:  restaurant.rating), forState: .Normal)
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been Here"
            cell.valueLabel.text = restaurant.isVisited ? "Yes, I've been here" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }

    @IBAction func close(segue: UIStoryboardSegue){
        if let reviewViewController = segue.sourceViewController as? ReviewViewController{
            if let rating = reviewViewController.rating {
                ratingButton.setImage(UIImage(named:  rating), forState: .Normal)
                restaurant.rating = rating
                if updateRestaurant != nil {
                    updateRestaurant.updateRating(rating, restaurantAtIndex: restaurantIndex)
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
