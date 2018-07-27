//
//  CheckVersion.swift
//  CheckVersion
//
//  Created by Mario Monaco on 27/07/18.
//

import Foundation
import FirebaseRemoteConfig

public class CheckVersion{
    
    static private var currentConfiguration : CheckVersionConfiguration = CheckVersionConfiguration.default
    
    public class func initialize(configuration: CheckVersionConfiguration = CheckVersionConfiguration.default){
        CheckVersion.currentConfiguration = configuration
    }
    
    public class func check(_ completion: @escaping (CVResult) -> ()){
        let version = CVUtility.getAppVersionForFirebaseRemote()
        let remoteConfig = RemoteConfig.remoteConfig()
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: true)
        remoteConfig.configSettings = remoteConfigSettings
        remoteConfig.fetch(withExpirationDuration: TimeInterval(10)){ (status, error) -> Void in
            switch status{
            case .success:
                remoteConfig.activateFetched()
                let check = remoteConfig.configValue(forKey: "CheckVersion_\(version)").stringValue
                if let check = check?.lowercased(){
                    print("check --> \(check)")
                    if check == "forceupdate"{
                        completion(.forceUpdate)
                    }else if check == "infoupdate"{
                        completion(.infoUpdate)
                    }else if check == "versionok"{
                        completion(.versionOk)
                    }else{
                        completion(.versionUnknown)
                    }
                }else{
                    completion(.versionUnknown)
                }
                break
            default:
                completion(.error)
                break
            }
        }
    }
    
}
