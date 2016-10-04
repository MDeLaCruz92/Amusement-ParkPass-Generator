//
//  Sound.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Michael De La Cruz on 9/29/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import Foundation
import AudioToolbox

struct Sound {
    
    //MARK: Properties
    var accessGrantedSound: SystemSoundID = 0
    var accessDeniedSound: SystemSoundID = 1
    
    //Properties which get the right sound based on path
    var accessGranted: NSURL {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("AccessGranted", ofType: "wav")
        return NSURL(fileURLWithPath: pathToSoundFile!)
    }
    
    var accessDenied: NSURL {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("AccessDenied", ofType: "wav")
        return NSURL(fileURLWithPath: pathToSoundFile!)
    }
    
    //MARK: Helper
    mutating func loadSoundWithURL(url: NSURL, inout id: SystemSoundID) {
        AudioServicesCreateSystemSoundID(url, &id)
    }
    
    //MARK: Play the correct sound
    mutating func playAccessGrantedSound() {
        loadSoundWithURL(accessGranted, id: &accessGrantedSound)
        AudioServicesPlaySystemSound(accessGrantedSound)
    }
    
    mutating func playAccessDeniedSound() {
        loadSoundWithURL(accessDenied, id: &accessDeniedSound)
        AudioServicesPlaySystemSound(accessDeniedSound)
    }
    
}
