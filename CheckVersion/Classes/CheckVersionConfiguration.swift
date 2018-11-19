//
//  CheckVersionConfiguration.swift
//  CheckVersion
//
//  Created by Mario Monaco on 27/07/18.
//

import Foundation

public class FirebaseCheckVersionConfiguration{
    
    private static var pDefault : FirebaseCheckVersionConfiguration?
    /// This is the default configuration
    public static var `default` : FirebaseCheckVersionConfiguration{
        get{
            if pDefault == nil{
                pDefault = FirebaseCheckVersionConfiguration()
            }
            return pDefault!
        }
    }
    
    public var shared : UIApplication?
    
    /// In case of version unknown will be not show the alert if this boolean is true
    public var continueOnVersionUnknown : Bool = true
    
    /// In case of error will be not show the alert if this boolean is true
    public var continueOnError : Bool = true
    
    /// The label showed to info the user that a new update is avaiable and could updates
    public var labelInfoUpdate : String = "A new update is avaiable."
    
    /// The label showed to info the user that a new update is avaiable and HAS TO update
    public var labelForceUpdate : String = "A new update is avaiable. Please update to continue using this application."
    
    /// The label showed in the alert button update
    public var labelButtonUpdate : String = "Update"
    
    /// The label showed in the alert to avoid update
    public var labelButtonNotNow : String = "Not now"
    
    /// The label showed in the alert for Ok button
    public var labelButtonOk : String = "Ok"
    
    /// The label showed in the alert title
    public var labelAlertTitle : String = "Warning"
    
    /// The label showed in the alert in case of error
    public var labelAlertError : String = "An error occurred, please try again later."
    
    /// The url of the store where the user will be redirected when tapping on update button
    public var urlStore : URL = URL(string: "itms-apps://itunes.apple.com")!
    
    // The cache duration of Firebase Remote Config
    public var duration : TimeInterval = TimeInterval(60)
    
    // The prepend key which needs to be compliant with Firebase Console
    public var prependKey : String = "iOSVersion_"
    
}
