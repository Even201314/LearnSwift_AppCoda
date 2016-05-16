//
//  Restaurant.swift
//  FoodPin
//
//  Created by Even201314 on 11/5/16.
//  Copyright © 2016年 Even. All rights reserved.
//

import Foundation
import CoreData

class Restaurant: NSManagedObject{
    @NSManaged var name :String
    @NSManaged var type :String
    @NSManaged var location :String
    @NSManaged var image :NSData?
    @NSManaged var phoneNumber :String?
    @NSManaged var isVisited :NSNumber?
    @NSManaged var rating :String?
}