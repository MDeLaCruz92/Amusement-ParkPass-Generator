//
//  Model.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 9/23/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import Foundation

// Model protocol to which every type of Model has to conform

protocol TypeModel {
    func createPassForEntrant(entrant: TypeEntrant) -> PassGenerator
    func validateAreaAccessForPass(pass: PassGenerator, andArea areas: AreaAccess) -> Bool
    func validateRideAccessForPass(pass: PassGenerator, andRide rides: RideAccess) -> Bool
    func validateDiscountAccessForPass(pass: PassGenerator, andDiscount discounts: Discount) -> Bool
}

struct Model: TypeModel {
    
    //Create a pass for the entrant
    func createPassForEntrant(entrant: TypeEntrant) -> PassGenerator {
        return PassGenerator(entrant: entrant)
    }
    
    //Validates if the pass is allowed to access an Area, like Amusement and Maintenace Areas
    func validateAreaAccessForPass(pass: PassGenerator, andArea area: AreaAccess) -> Bool {
        for access in pass.areaAccess {
            if access == area {
                return true
            }
        }
        return false
        
    }
    
    //Validate if the pass is allowed to access a ride, such as all rides or if the entrant is allowed to skip lines
    func validateRideAccessForPass(pass: PassGenerator, andRide ride: RideAccess) -> Bool {
        for access in pass.rideAccess {
            if access == ride {
                return true
            }
        }
        return false
    }
    
    //Validates if the pass is allowed to receieve a discount on food or merchandise
    func validateDiscountAccessForPass(pass: PassGenerator, andDiscount discount: Discount) -> Bool {
        if let access = pass.discountAccess {
            for discountAccess in access {
                switch (discountAccess, discount) {
                case (let .DiscountOnFood(value1), let .DiscountOnFood(value2)):
                    if value1 == value2 {
                        return true
                    } else {
                        return false
                    }
                case(let .DiscountOnMerchandise(value1), let .DiscountOnMerchandise(value2)):
                    if value1 == value2 {
                        return true
                    } else {
                        return false
                    }
                default: break
                }
            }
        }
        return false
    }
}















