//
//  CVUtility.swift
//  CheckVersion
//
//  Created by Mario Monaco on 27/07/18.
//

import Foundation

public class CVUtility{
    
    public class func getAppVersionForFirebaseRemote() -> String{
        var version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        version = version.replacingOccurrences(of: ".", with: "_")
        return version
    }
    
    public class func getAppVersion() -> String{
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        return version
    }
    
    public class func getBuildNumber() -> String{
        let version = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
        return version
    }
    
}
