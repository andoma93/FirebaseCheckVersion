//
//  CheckVersionConfiguration.swift
//  CheckVersion
//
//  Created by Mario Monaco on 27/07/18.
//

import Foundation

public class CheckVersionConfiguration{
    
    private static var pDefault : CheckVersionConfiguration?
    public static var `default` : CheckVersionConfiguration{
        get{
            if pDefault == nil{
                pDefault = CheckVersionConfiguration()
            }
            return pDefault!
        }
    }
    var continueOnVersionUnknown : Bool = false
    var continueOnError : Bool = true
    
    var labelInfoUpdate : String = "A new update is avaiable."
    var labelForceUpdate : String = "A new update is avaiable. Please update to continue using this application."
    var labelButtonUpdate : String = "Update"
    var labelButtonNotNow : String = "Not now"
    var labelButtonOk : String = "Ok"
    var labelAlertTitle : String = "Warning"
    var labelAlertError : String = "An error occurred, please try again later."
    
    var urlStore : URL = URL(string: "itms://")!
    var duration : TimeInterval = TimeInterval(60)
    var appendKey : String = "iOSVersion_"
    
}
