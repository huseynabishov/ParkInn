//
//  MainMenu.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 18.06.2022.
//

import SwiftUI
import NavigationStack

struct MainMenu: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    private static let childID = "ForgetPasswordId"
    
    var body: some View {
        
        ZStack{
            MapView()
            
            VStack(spacing: 0){
                
                HStack{
                    Spacer()
                    SearchButton(title: "magnifyingglass", action: {
                        self.navigationStack.push(SearchScreen())
                    })
                    
                    NotificationButton(title: "bell", action: {
                        self.navigationStack.push(NotificationMenu())
                    })
                    .padding(.trailing)
                }
                Spacer()
                
                VStack(spacing: 0){
                    
                    ZStack(){
                        LocationPinButton(title: "", action: {
                            self.navigationStack.push(ParkingDetails())
                        })
                        Image("location.fill")
                    }
                    .padding(.leading, 325)
                    Spacer()
                        .frame(height: 0)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 15){
                            LocationNameButton(title: "Home", action: {
                                self.navigationStack.push(NotificationMenu())
                            })
                            LocationNameButton(title: "Office", action: {
                                self.navigationStack.push(NotificationMenu())
                            })
                            LocationNameButton(title: "Hospitals", action: {
                                self.navigationStack.push(NotificationMenu())
                            })
                            LocationNameButton(title: "Police Station", action: {
                                self.navigationStack.push(NotificationMenu())
                            })
                            LocationNameButton(title: "School", action: {
                                self.navigationStack.push(NotificationMenu())
                            })
                            LocationNameButton(title: "Trafalgar Square", action: {
                                self.navigationStack.push(NotificationMenu())
                            })
                        }
                        .padding()
                    }
                    .padding(.bottom, 70)
                }
            }
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainMenu()
                .preferredColorScheme(.light)
            MainMenu()
                .preferredColorScheme(.dark)
        }
    }
}
