//
//  CheckVersionConfiguration.swift
//  CheckVersion
//
//  Created by Mario Monaco on 27/07/18.
//

import Foundation

public class CheckVersionConfiguration{
    
    public static var `default` : CheckVersionConfiguration{
        get{
            return CheckVersionConfiguration(labelInfoUpdate: "Please Update", labelForceUpdate: "Force Update", duration: TimeInterval(120))
        }
    }
    
    var labelInfoUpdate : String
    var labelForceUpdate : String
    var duration : TimeInterval
    
    init(labelInfoUpdate: String, labelForceUpdate: String, duration: TimeInterval) {
        self.labelInfoUpdate = labelInfoUpdate
        self.labelForceUpdate = labelForceUpdate
        self.duration = duration
    }
    
}
