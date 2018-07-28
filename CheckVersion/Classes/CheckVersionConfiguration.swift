//
//  CheckVersionConfiguration.swift
//  CheckVersion
//
//  Created by Mario Monaco on 27/07/18.
//

import Foundation

private class CheckVersionConfiguration{
    
    private static var pDefault : CheckVersionConfiguration?
    public static var `default` : CheckVersionConfiguration{
        get{
            if pDefault == nil{
                pDefault = CheckVersionConfiguration()
            }
            return pDefault!
        }
    }
    
    var labelInfoUpdate : String
    var labelForceUpdate : String
    var duration : TimeInterval
    
    init() {
        self.labelInfoUpdate = "InfoNewUpdateAvaiable"
        self.labelForceUpdate = "ForceNewUpdateAvaiable"
        self.duration = TimeInterval(60)
    }
    
}
