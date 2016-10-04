//
//  Manager.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 9/29/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import Foundation



// Protocol to which every manager type has to conform
protocol TypeManager: TypeEntrant {
    var firstName: String { get }
    var lastName: String { get }
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
    var socialSecurityID: Int { get }
    var dateOfBirth: NSDate { get }
    var typeManager: ManagementList { get }
}

// Enum to differentiate between the various Manager types
enum ManagementList {
    case ShiftManager, GeneralManager, SeniorManager
}

struct Manager: TypeManager {
    
    // MARK: Properties
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var socialSecurityID: Int
    var dateOfBirth: NSDate
    var typeManager: ManagementList
    
    var pass: PassGenerator?
    
    //MARK: Initializer
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?, socialSecurityID: Int?, dateOfBirth: String?, typeManager: ManagementList?) throws {
        
        guard let firstN = firstName, let lastN = lastName else { throw TypeError.MissingName }
        
        guard let address = streetAddress, let city = city, let state = state, let zipC = zipCode else { throw TypeError.MissingAddress }
        
        guard let securityID = socialSecurityID else { throw TypeError.MissingSecurityID }
        
        guard let birthDate = dateOfBirth else { throw TypeError.MissingDateOfBirth }
        
        guard let type = typeManager else { throw TypeError.MissingType }
        
        self.firstName = firstN
        self.lastName = lastN
        self.streetAddress = address
        self.city = city
        self.state = state
        self.zipCode = zipC
        self.socialSecurityID = securityID
        self.dateOfBirth = dateFormatter.dateFromString(birthDate)!
        self.typeManager = type
    }
    
}

















