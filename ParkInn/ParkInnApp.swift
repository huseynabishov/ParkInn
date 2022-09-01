//
//  ParkInnApp.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 19.05.2022.
//

import SwiftUI
import NavigationStack

@main
struct ParkInnApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStackView(transitionType: .custom(AnyTransition.opacity.animation(.easeInOut(duration:0.7)))){
                
                ContentView()
            }
        }
    }
}

