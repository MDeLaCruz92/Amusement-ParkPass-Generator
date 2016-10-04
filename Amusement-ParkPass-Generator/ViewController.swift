//
//  ViewController.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 9/23/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //MARK: Properties
    let model = Model()
    var guest: TypeEntrant?
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         do {
         let classicGuest = try Guest(dateOfBirth: nil, typeGuest: .Classic)
         
         self.guest = classicGuest
         
         } catch {
         print(error)
         }
         */
        
        /*
         do {
         let vip = try Guest(dateOfBirth: nil, typeGuest: .VIP)
         
         self.guest = vip
         } catch {
         print(error)
         }
         */
        
        /*
         do {
         let freeChildError = try Guest(dateOfBirth: "01/3/2004", typeGuest: .FreeChild)
         
         self.guest = freeChildError
         
         } catch TypeError.ChildOlderThanSeven {
         print("Apologizes, I'm afraid that you're child is older than 7")
         } catch {
         print(error)
         }
         */
        
        /*
         do {
         let maintenace = try Employee(firstName: "Tom", lastName: "Jerry", streetAddress: "SoHo", city: "NYC", state: "New York", zipCode: 10014, socialSecurityID: 2222, dateOfBirth: "6/21/1992", typeEmployee: .Maintenance)
         
         self.guest = maintenace
         
         } catch {
         print(error)
         }
         */
        
        
        /*
         do {
         let foodServiceError = try Employee(firstName: nil, lastName: nil, streetAddress: "nilAddress", city: "nilCity", state: "nilState", zipCode: 10000, socialSecurityID: 3333, dateOfBirth: "02/3/1993", typeEmployee: .FoodServices)
         
         self.guest = foodServiceError
         
         } catch TypeError.MissingName {
         print("No name was used")
         } catch {
         print(error)
         }
         */
        
        /*
         //General Manager
         do {
         let generalManager = try Manager(firstName: "Steve", lastName: "Jobs", streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityID: 4444, dateOfBirth: "2/24/1955", typeManager: .GeneralManager)
         
         self.guest = generalManager
         
         } catch TypeError.MissingAddress {
         print("Please provide an address")
         } catch {
         print(error)
         }
         */
        
        /*
         //Senior Manager
         do {
         let seniorManager = try Manager(firstName: "Luke", lastName: "Cage", streetAddress: "Central Harlem", city: "NYC", state: "New York", zipCode: 10026, socialSecurityID: 5555, dateOfBirth: "03/22/1986", typeManager: .SeniorManager)
         
         self.guest = seniorManager
         
         } catch {
         print(error)
         }
         */
        
        /*
         //swipe pass at the model area
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forArea: .ModelAreas)
         } catch TypeError.MissingPass {
         print("No access pass, please have a pass")
         } catch {
         print(error)
         }
         }
         */
        
        /*
         //swipe pass at the amusement area
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forArea: .AmusementAreas)
         } catch TypeError.MissingPass {
         print("No access pass, please have a pass")
         } catch {
         print(error)
         }
         }
         */
        
        /*
         //swipe pass at a ride control area
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest .swipePass(forArea: .RideControlAreas)
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have a pass")
         } catch {
         print(error)
         }
         }
         */
        
        /*
         //swipe pass at the maintenance area
         do {
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forArea: .MaintenanceAreas)
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have one")
         } catch {
         print(error)
         }
         }
         */
        
        /*
         //swipe pass at the office area
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forArea: .OfficeAreas)
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have one")
         } catch {
         print(error)
         }
         }
         */
        
        
        /*
         //swipe pass at the ride
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forRide: .AllRides)
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have one")
         } catch {
         print(error)
         }
         }
         
         */
        
        /*
         
         //swipe pass to skip the ride lines
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forRide: .SkipAllRideLines)
         } catch TypeError.MissingPass {
         print("Don't have a pass, please have one")
         } catch {
         print(error)
         }
         }
         */
        
        /*
         //swipe pass to recieve a 10% discount on food
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forDiscount: .DiscountOnFood(discount: 10))
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have one")
         } catch {
         print(error)
         }
         }
         
         */
        
        /*
         //swipe pass to recieve a 15% discount on food
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forDiscount: .DiscountOnFood(discount: 15))
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have one")
         } catch {
         print(error)
         }
         }
         */
        
        /*
         //swipe pass to recieve a 25% discount on food
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forDiscount: .DiscountOnFood(discount: 25))
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have one")
         } catch {
         print(error)
         }
         }
         
         */
        
        /*
         //swipe pass to recieve a 20% discount on merchandise
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forDiscount: .DiscountOnMerchandise(discount: 20))
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have one")
         } catch {
         print(error)
         }
         }
         */
        
        /*
         //swipe pass to recieve a 25% discount on merchandise
         if var guest = self.guest {
         let pass = self.model.createPassForEntrant(guest)
         guest.pass = pass
         
         do {
         try guest.swipePass(forDiscount: .DiscountOnMerchandise(discount: 25))
         } catch TypeError.MissingPass {
         print("Don't have an access pass, please have one")
         } catch {
         print(error)
         }
         }
         */
        
    }
}












