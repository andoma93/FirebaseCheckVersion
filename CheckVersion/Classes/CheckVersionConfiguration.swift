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
    public var continueOnVersionUnknown : Bool = true
    public var continueOnError : Bool = true
    
    public var labelInfoUpdate : String = "A new update is avaiable."
    public var labelForceUpdate : String = "A new update is avaiable. Please update to continue using this application."
    public var labelButtonUpdate : String = "Update"
    public var labelButtonNotNow : String = "Not now"
    public var labelButtonOk : String = "Ok"
    public var labelAlertTitle : String = "Warning"
    public var labelAlertError : String = "An error occurred, please try again later."
    
    public var urlStore : URL = URL(string: "itms-apps://itunes.apple.com")!
    public var duration : TimeInterval = TimeInterval(60)
    public var prependKey : String = "iOSVersion_"
    
}
