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

    var body: some View {
        
        VStack(spacing: 20, content:{
            ZStack{
                Text("")
                    .frame(width: 500, height: 1000)
                    .background(Color.gray)
                
                HStack(spacing: 13, content: {
                    
                    SearchButton(title: "magnifyingglass", action: {
                        self.navigationStack.push(SearchScreen())
                    })
                    NotificationButton(title: "bell", action: {
                        self.navigationStack.push(NotificationMenu())
                    })
                })
            }
            Spacer()            
        })
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
