//
//  CheckVersion.swift
//  CheckVersion
//
//  Created by Mario Monaco on 27/07/18.
//

import Foundation
import FirebaseRemoteConfig

public class FirebaseCheckVersion{
    
    private static let keyForceUpdate = "forceupdate"
    private static let keyInfoUpdate = "infoupdate"
    private static let keyVersionOk = "versionok"
    
    /// Checks the current version
    ///
    /// - Parameters:
    ///   - completion: a callback called at the end of the check: check CVResult enum for result
    public class func check(_ completion: @escaping (CVResult) -> ()){
        let version = CVUtility.getAppVersionForFirebaseRemote()
        let remoteConfig = FirebaseCheckVersion.remoteConfig()
        remoteConfig.fetch(withExpirationDuration: FirebaseCheckVersionConfiguration.default.duration){ (status, error) -> Void in
            switch status{
            case .success, .throttled:
                remoteConfig.activateFetched()
                let check = remoteConfig.configValue(forKey: "\(FirebaseCheckVersionConfiguration.default.prependKey)\(version)").stringValue
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
    
    /// Checks the current version showing an alert if needed
    ///
    /// - Parameters:
    ///   - viewController: the UIViewController that could present the alert
    ///   - completion: a callback called at the end of the check *versionIsOk* will be true if the current version is ok, false otherwise
    public class func checkWithAlert(viewController: UIViewController, _ completion: @escaping (_ versionIsOk: Bool) -> ()){
        FirebaseCheckVersion.check{ result in
            prepareAlert(viewController: viewController, result: result, completion: completion)
        }
    }
    
    private class func prepareAlert(viewController: UIViewController, result: CVResult, completion: @escaping (_ versionIsOk: Bool) -> ()){
        let title = FirebaseCheckVersionConfiguration.default.labelAlertTitle
        var message = FirebaseCheckVersionConfiguration.default.labelAlertError
        switch result{
        case .forceUpdate:
            message = FirebaseCheckVersionConfiguration.default.labelForceUpdate
            break
        case .infoUpdate:
            message = FirebaseCheckVersionConfiguration.default.labelInfoUpdate
            break
        case .versionUnknown:
             if FirebaseCheckVersionConfiguration.default.continueOnVersionUnknown{
                completion(FirebaseCheckVersionConfiguration.default.continueOnVersionUnknown)
                return
             }
            message = FirebaseCheckVersionConfiguration.default.labelAlertError
            break
        case .error:
            if FirebaseCheckVersionConfiguration.default.continueOnError{
                completion(true)
                return
            }
            message = FirebaseCheckVersionConfiguration.default.labelAlertError
            break
        case .versionOk:
            completion(true)
            return
        }
        showAlert(title: title, message: message, viewController: viewController, result: result, completion: completion)
    }
    
    private class func showAlert(title: String, message: String, viewController: UIViewController, result: CVResult, completion: @escaping (_ versionIsOk: Bool) -> ()){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let notNow = UIAlertAction(title: FirebaseCheckVersionConfiguration.default.labelButtonNotNow,style: .default, handler: { action in
            //nothing to do here
        })
        let update = UIAlertAction(title: FirebaseCheckVersionConfiguration.default.labelButtonUpdate,style: .default, handler: { action in
            UIApplication.shared.openURL(FirebaseCheckVersionConfiguration.default.urlStore)
        })
        var completionResult = false
        switch result{
        case .forceUpdate:
            alertController.addAction(update)
            completionResult = false
            break
        case .infoUpdate:
            alertController.addAction(notNow)
            alertController.addAction(update)
            completionResult = true
            break
        case .versionUnknown, .error:
            let okAction = UIAlertAction(title: FirebaseCheckVersionConfiguration.default.labelButtonOk,style: .default, handler: { action in
                //nothing to do here
            })
            alertController.addAction(okAction)
            completionResult = false
            break
        case .versionOk:
            return
        }
        viewController.present(alertController, animated: true)
        completion(completionResult)
    }
    
    private class func remoteConfig() -> RemoteConfig {
        let remoteConfig = RemoteConfig.remoteConfig()
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: false)
        remoteConfig.configSettings = remoteConfigSettings
        return remoteConfig
    }
    
}
