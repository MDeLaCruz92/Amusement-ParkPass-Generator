//
//  TypeError.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 9/29/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import Foundation

enum TypeError: ErrorType {
    case MissingName
    case MissingSecurityID
    case MissingAddress
    case MissingDateOfBirth
    case MissingType
    case MissingPass
    case ChildOlderThanSeven
}
