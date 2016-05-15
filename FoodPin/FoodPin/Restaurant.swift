//
//  Restaurant.swift
//  FoodPin
//
//  Created by Even201314 on 11/5/16.
//  Copyright © 2016年 Even. All rights reserved.
//

import Foundation

class Restaurant{
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var phoneNumber = ""
    var isVisited = false
    var rating = ""
    
    init(name: String, type: String, location: String, phoneNumber: String, image: String, isVisited: Bool, rating: String){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        self.rating = rating
    }
}