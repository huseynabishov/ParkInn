//
//  MainMenu.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 18.06.2022.
//

import SwiftUI
import NavigationStack

struct MainMenu: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    private static let childID = "ForgetPasswordId"
    @State var selectedTab: Int = 4

    var body: some View {
        
        VStack(spacing: 20, content:{
            ZStack{
                HStack(content: {
                    Spacer()
                    SearchButton(title: "magnifyingglass", action: {
                        self.navigationStack.push(SearchScreen())
                    })
                    NotificationButton(title: "bell", action: {
                        self.navigationStack.push(NotificationMenu())
                    })
                    .padding(.trailing)
                })
            }
            Spacer()
//            Divider()
            TabView(selection: $selectedTab) {
                
                Text("ds")
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
                SavedScreen()
                .tabItem{
                    Image(systemName: "bookmark")
                    Text("Saved")
                }
                .tag(1)

                ReservationScreen()
                .tabItem{
                    Image(systemName: "note.text")
                    Text("Booking")
                }
                .tag(2)

                SavedScreen()
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3)

            }
        })
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
