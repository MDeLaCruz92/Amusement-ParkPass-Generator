//
//  TypeEntrant.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 9/30/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import Foundation

//TypeEntrant protocol conforms every entrant

protocol TypeEntrant {
    var pass: PassGenerator? { get set }
    func swipePass(forArea area: AreaAccess) throws
    func swipePass(forRide ride: RideAccess) throws
    func swipePass(forDiscount discount: Discount) throws
}

//Extension to give a default swipe implementation to every type which conforms to the TypeEntrant protocol
extension TypeEntrant {
    
    //Swipe the pass at an arena, to get access to amusement or maintenance areas
    func swipePass(forArea area: AreaAccess) throws {
        guard let pass = pass else { throw TypeError.MissingPass }
        
        var sound = Sound()
        
        let model = Model()
        
        if model.validateAreaAccessForPass(pass, andArea: area) {
            print("Access Granted to: \(area)")
            sound.playAccessGrantedSound()
            hasGuestBirthday()
        } else {
            print("Access is not Granted to:\(area)")
            sound.playAccessDeniedSound()
        }
    }
    
    //Swipe the pass at a ride, to get access to rides or skip lines
    func swipePass(forRide ride: RideAccess) throws {
        guard let pass = pass else { throw TypeError.MissingPass }
        
        var sound = Sound()
        
        let model = Model()
        
        if model.validateRideAccessForPass(pass, andRide: ride) {
            print("Access Granted to: \(ride)")
            sound.playAccessGrantedSound()
            hasGuestBirthday()
        } else {
            print("Access is not Granted to: \(ride)")
            sound.playAccessDeniedSound()
        }
        
    }
    
    //Swipe the pass at a shop or eatery, to get discounts on food and/or merchandise
    func swipePass(forDiscount discount: Discount) throws {
        guard let pass = pass else { throw TypeError.MissingPass }
        
        var sound = Sound()
        
        let model = Model()
        
        if model.validateDiscountAccessForPass(pass, andDiscount: discount) {
            switch discount {
            case let .DiscountOnFood(value):
                print("Discount is countable for \(value)% off of food")
                sound.playAccessGrantedSound()
                hasGuestBirthday()
            case let .DiscountOnMerchandise(value):
                print("Discount is countable for \(value)% off of merchandise")
            }
        } else {
            switch discount {
            case let .DiscountOnFood(value):
                print("Discount is not countable for \(value)% off of food")
                sound.playAccessDeniedSound()
            case let .DiscountOnMerchandise(value):
                print("Discount is not countable for \(value)% off of merchandise")
                sound.playAccessDeniedSound()
            }
        }
    }
    
    // Private function to check if the entrant's brithday is on the day
    private func hasGuestBirthday() {
        switch self {
        case let guest as Guest:
            if let birthday = guest.birthday {
                
                let calendar = NSCalendar.currentCalendar()
                let todayComponents = calendar.components([.Month, .Day], fromDate: NSDate())
                let birthdayComponents = calendar.components([.Month, .Day], fromDate: birthday)
                
                
                if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
                    print("Happy Birthday")
                }
            }
        case let employee as Employee:
            let birthday = employee.dateOfBirth
            
            let calendar = NSCalendar.currentCalendar()
            let todayComponents = calendar.components([.Month, .Day], fromDate: NSDate())
            let birthdayComponents = calendar.components([.Month, .Day], fromDate: birthday)
            
            if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
                print("Happy Birthday")
            }
            
        case let manager as Manager:
            let birthday = manager.dateOfBirth
            
            let calendar = NSCalendar.currentCalendar()
            let todayComponents = calendar.components([.Month, .Day], fromDate: NSDate())
            let birthdayComponents = calendar.components([.Month, .Day], fromDate: birthday)
            
            if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
                print("Happy Birthday")
            }
            
        default: break
        }
    }
}
























