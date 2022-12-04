//
//  ParkInnApp.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 19.05.2022.
//

import SwiftUI
import NavigationStack
import Firebase
import GoogleSignIn

@main
struct ParkInnApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStackView(transitionType: .custom(AnyTransition.opacity.animation(.easeInOut(duration:0.7)))){
                
                FillProfile()
                    
                
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return GIDSignIn.sharedInstance.handle(url)
    }
}
