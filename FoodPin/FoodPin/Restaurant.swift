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
    var isVisited = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}