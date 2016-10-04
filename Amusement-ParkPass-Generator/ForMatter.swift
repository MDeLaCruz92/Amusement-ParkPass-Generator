//
//  ForMatter.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 10/3/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import Foundation

//Converts the date to the correct format
var dateFormatter: NSDateFormatter = {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM/DD/YYYY"
    return dateFormatter
}()
