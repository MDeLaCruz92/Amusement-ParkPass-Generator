//
//  PassGenerator.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 9/29/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import UIKit

// The TypePass protocol to which every Pass has to conform

protocol TypePass {
    var image: UIImage? { get }
    var type: String? { get }
    var entrantName: String? { get }
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [Discount]? { get }
}

struct PassGenerator: TypePass {
    //MARK: Properties
    var image: UIImage?
    var type: String?
    var entrantName: String?
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [Discount]?
    
    
    //MARK: Helper enum
    // Type enum provides the type of pass the entrant gets
    enum Type: String {
        case ClassicGuestPass = "Classic Guest Pass"
        case ChildGuestPass = "Child Guest Pass"
        case VIPGuestPass = "VIP Guest Pass"
        case FoodServicePass = "Food Services Pass"
        case RideServicePass = "Ride Services Pass"
        case MaintenancePass = "Maintenance Services Pass"
        case ShiftManagerPass = "Shift Manager Pass"
        case GeneralManagerPass = "General Manager Pass"
        case SeniorManagerPass = "Senior Manager Pass"
    }
    
    //MARK: Initializer
    //Initialization is done via the TypeEntrant protocol. Switches allow to initialize the Pass with the correct entrant type
    init(entrant: TypeEntrant) {
        switch entrant {
        case let guest as Guest:
            self.entrantName = nil
            
            switch guest.type {
            case .Classic:
                self.type = Type.ClassicGuestPass.rawValue
            case .VIP:
                self.type = Type.VIPGuestPass.rawValue
            case .FreeChild:
                self.type = Type.ChildGuestPass.rawValue
            }
            
        case let employee as Employee:
            self.entrantName = "\(employee.firstName) \(employee.lastName)"
            
            switch employee.typeEmployee {
            case .FoodServices:
                self.type = Type.FoodServicePass.rawValue
            case .RideServices:
                self.type = Type.RideServicePass.rawValue
            case .Maintenance:
                self.type = Type.MaintenancePass.rawValue
            }
            
        default: break
        }
        
        //Assign the right access to the properties
        self.areaAccess = AreaAccess.validateAccessForEntrant(entrant)
        self.rideAccess = RideAccess.validateAccessForEntrant(entrant)
        self.discountAccess = Discount.validateAccessForEntrant(entrant)
    }
}

//MARK: Access Enums
//The AreaAccess enum holds the different areas and validates which entrant is allowed to which area
enum AreaAccess {
    case AmusementAreas, ModelAreas, RideControlAreas, MaintenanceAreas, OfficeAreas
    
    static func validateAccessForEntrant(entrant: TypeEntrant) -> [AreaAccess] {
        var access = [AreaAccess]()
        
        switch entrant {
        case is Guest: access = [.AmusementAreas]
        case let employee as Employee:
            switch employee.typeEmployee {
            case .FoodServices: access = [.AmusementAreas, .ModelAreas]
            case .RideServices: access = [.AmusementAreas, .RideControlAreas]
            case .Maintenance:  access = [.AmusementAreas, ModelAreas, .RideControlAreas, MaintenanceAreas]
            }
        case is Manager: access = [.AmusementAreas, .ModelAreas, .RideControlAreas, .MaintenanceAreas, .OfficeAreas]
        default: break
        }
        
        return access
    }
}

//The RideAccess enum holds the different areas and validates which entrant is allowed access to which ride
enum RideAccess {
    case AllRides, SkipAllRideLines
    
    static func validateAccessForEntrant(entrant: TypeEntrant) -> [RideAccess] {
        var access = [RideAccess]()
        
        switch entrant {
        case let guest as Guest:
            switch guest.type {
            case .Classic, .FreeChild: access = [.AllRides]
            case .VIP: access = [.AllRides, SkipAllRideLines]
            }
        case is Employee: access = [.AllRides]
        case is Manager: access = [.AllRides]
        default: break
        }
        
        return access
    }
}

//The Discount enum holds the different areas and grants the VIP guests to discounts
enum Discount {
    case DiscountOnFood(discount: Int)
    case DiscountOnMerchandise(discount: Int)
    
    static func validateAccessForEntrant(entrant: TypeEntrant) -> [Discount]? {
        var access: [Discount]?
        
        switch entrant {
        case let guest as Guest:
            switch guest.type {
            case .VIP: access = [.DiscountOnFood(discount: 10), DiscountOnMerchandise(discount: 20)]
            default: access = nil
            }
        case is Employee: access = [.DiscountOnFood(discount: 15), .DiscountOnMerchandise(discount: 25)]
        case is Manager: access = [.DiscountOnFood(discount: 25), .DiscountOnMerchandise(discount: 25)]
        default: break
        }
        
        return access
        
    }
    
}







