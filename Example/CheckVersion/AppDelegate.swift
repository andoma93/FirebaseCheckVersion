//
//  AppDelegate.swift
//  CheckVersion
//
//  Created by andoma93 on 07/27/2018.
//  Copyright (c) 2018 andoma93. All rights reserved.
//

import UIKit
import CheckVersion
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        CheckVersionConfiguration.default.urlStore = URL(string: "itms-apps://itunes.apple.com")!
        CheckVersionConfiguration.default.continueOnError = false
        CheckVersionConfiguration.default.continueOnVersionUnknown = false
        CheckVersionConfiguration.default.prependKey = "MyPrependKey_"
        CheckVersionConfiguration.default.duration = TimeInterval(120)
        CheckVersionConfiguration.default.labelAlertError = "Si è verificato un errore generico, per favore riprova più tardi"
        CheckVersionConfiguration.default.labelButtonNotNow = "Non adesso"
        CheckVersionConfiguration.default.labelButtonUpdate = "Aggiorna"
        CheckVersionConfiguration.default.labelForceUpdate = "E' disponibile una nuova versione dell'app: per favore aggiornala adesso"
        CheckVersionConfiguration.default.labelInfoUpdate = "E' disponibile una nuova versione dell'app: se vuoi aggiornala adesso"
        CheckVersionConfiguration.default.labelAlertTitle = "Attenzione"
        CheckVersionConfiguration.default.labelButtonOk = "Ok"
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

