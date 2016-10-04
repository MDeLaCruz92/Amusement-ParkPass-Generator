//
//  Guest.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 9/29/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import Foundation

// Enum with the different types of guests

enum TypeGuest {
    case Classic, VIP, FreeChild
}

struct Guest: TypeEntrant {
    var type: TypeGuest
    var birthday: NSDate?
    var pass: PassGenerator?
    
    //MARK: Initializer
    init(dateOfBirth: String?, typeGuest: TypeGuest) throws {
        
        //Helper method to determine if the guest is under 7 years old and is allowed to enter as a 'Free Child'
        func underSevenYearsOld(birthdate: NSDate) -> Bool {
            let today = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components(.Year, fromDate: birthdate, toDate: today, options: .MatchFirst)
            
            if components.year <= 7 {
                return true
            } else {
                return false
            }
        }
        
        switch typeGuest {
        case .FreeChild:
            guard let birthday = dateOfBirth else { throw TypeError.MissingDateOfBirth }
            let birthdate = dateFormatter.dateFromString(birthday)
            
            self.birthday = birthdate
            
            if underSevenYearsOld(birthdate!) {
                self.type = .FreeChild
            } else {
                self.type = .Classic
                throw TypeError.ChildOlderThanSeven
            }
            
        default: self.type = typeGuest
            
        }
        
    }
    
}





