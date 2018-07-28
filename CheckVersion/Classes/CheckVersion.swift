//
//  CheckVersion.swift
//  CheckVersion
//
//  Created by Mario Monaco on 27/07/18.
//

import Foundation
import FirebaseRemoteConfig

public class CheckVersion{
    
    private static let keyForceUpdate = "forceupdate"
    private static let keyInfoUpdate = "infoupdate"
    private static let keyVersionOk = "versionok"
    
    public class func check(_ completion: @escaping (CVResult) -> ()){
        let version = CVUtility.getAppVersionForFirebaseRemote()
        let remoteConfig = CheckVersion.remoteConfig()
        remoteConfig.fetch(withExpirationDuration: CheckVersionConfiguration.default.duration){ (status, error) -> Void in
            switch status{
            case .success:
                remoteConfig.activateFetched()
                let check = remoteConfig.configValue(forKey: "\(CheckVersionConfiguration.default.appendKey)\(version)").stringValue
                if let check = check?.lowercased(){
                    if check == keyForceUpdate{
                        completion(.forceUpdate)
                    }else if check == keyInfoUpdate{
                        completion(.infoUpdate)
                    }else if check == keyVersionOk{
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
    
    public class func checkWithAlert(viewController: UIViewController, _ completion: @escaping (_ versionIsOk: Bool) -> ()){
        CheckVersion.check{ result in
            prepareAlert(viewController: viewController, result: result, completion: completion)
        }
    }
    
    private class func prepareAlert(viewController: UIViewController, result: CVResult, completion: @escaping (_ versionIsOk: Bool) -> ()){
        let title = CheckVersionConfiguration.default.labelAlertTitle
        var message = CheckVersionConfiguration.default.labelAlertError
        switch result{
        case .forceUpdate:
            message = CheckVersionConfiguration.default.labelForceUpdate
            break
        case .infoUpdate:
            message = CheckVersionConfiguration.default.labelInfoUpdate
            break
        case .versionUnknown:
             if CheckVersionConfiguration.default.continueOnVersionUnknown{
                completion(CheckVersionConfiguration.default.continueOnVersionUnknown)
                return
             }
            message = CheckVersionConfiguration.default.labelAlertError
            break
        case .error:
            if CheckVersionConfiguration.default.continueOnError{
                completion(true)
                return
            }
            message = CheckVersionConfiguration.default.labelAlertError
            break
        case .versionOk:
            completion(true)
            return
        }
        showAlert(title: title, message: message, viewController: viewController, result: result, completion: completion)
    }
    
    private class func showAlert(title: String, message: String, viewController: UIViewController, result: CVResult, completion: @escaping (_ versionIsOk: Bool) -> ()){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let notNow = UIAlertAction(title: CheckVersionConfiguration.default.labelButtonNotNow,style: .default, handler: { action in
            completion(true)
        })
        let update = UIAlertAction(title: CheckVersionConfiguration.default.labelInfoUpdate,style: .default, handler: { action in
            UIApplication.shared.openURL(CheckVersionConfiguration.default.urlStore)
        })
        switch result{
        case .forceUpdate:
            alertController.addAction(update)
            break
        case .infoUpdate:
            alertController.addAction(notNow)
            alertController.addAction(update)
            break
        case .versionUnknown, .error:
            let okAction = UIAlertAction(title: CheckVersionConfiguration.default.labelButtonOk,style: .default, handler: { action in
                completion(false)
            })
            alertController.addAction(okAction)
            break
        case .versionOk:
            return
        }
        viewController.present(alertController, animated: true)
    }
    
    private class func remoteConfig() -> RemoteConfig {
        let remoteConfig = RemoteConfig.remoteConfig()
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: false)
        remoteConfig.configSettings = remoteConfigSettings
        return remoteConfig
    }
    
}
