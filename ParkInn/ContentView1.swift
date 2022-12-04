//
//  ContentView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 19.05.2022.
//

import SwiftUI
import NavigationStack

struct ContentView1: View {
    
    @State var tabBarPages: [TabBarPage] = [
        TabBarPage(page: MainMenu(), icon: "house", icon2: "house.fill", tag: "Home"),
        TabBarPage(page: MainMenu(), icon: "bookmark", icon2: "bookmark.fill", tag: "Bookmark"),
        TabBarPage(page: ParkingDetails(), icon: "doc.plaintext", icon2: "doc.plaintext.fill", tag: "Doc"),
        TabBarPage(page: MainMenu(), icon: "person.crop.circle", icon2: "person.crop.circle.fill", tag: "Profile"),
    ]
    
    var loggedIn: Bool = true
    
    var body: some View {
        Group {
            if loggedIn {
                TabBarView(pages: $tabBarPages)
            } else {
                NavigationStackView(transitionType: .custom(AnyTransition.opacity.animation(.easeInOut(duration:0.7)))){
                    OnboardingScreenView()
                }
            }
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
