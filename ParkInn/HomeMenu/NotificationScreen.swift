//
//  NotificationMenu.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 18.06.2022.
//

import SwiftUI
import NavigationStack

struct NotificationMenu: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    var body: some View {
        ScrollView{
                VStack(alignment: .center, spacing: 25, content: {
                    HStack(){
                        Spacer()
                            .frame(width: 15)
                        Arrow(title: "arrow.left", action: {
                            self.navigationStack.pop()
                        })
                        Spacer()
                            .frame(width: 15)
                        Text("Notification")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                        Spacer()
                            .frame(width: 8)
                        
                        Spacer()
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 22))
                        Spacer()
                            .frame(width: 10)
                    }
                    VStack(spacing: 20){
                        HStack{
                        Text("Today")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Spacer()
                                .frame(width: 330)
                        }
                        
                        NotifCircle(title: "", action: {})
                        NotifCircle(title: "", action: {})

//                        NotifCircle()
//                            .font(.system(size: 10))
                        
                    }
                    VStack(spacing: 20){
                        HStack{
                        Text("Yesterday")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Spacer()
                                .frame(width: 290)
                        }
                        NotifCircle(title: "", action: {})
                        NotifCircle(title: "", action: {})

                    }
                    VStack(spacing: 20){
                        HStack{
                        Text("December 11, 2024")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Spacer()
                                .frame(width: 200)
                        }
                        NotifCircle(title: "", action: {})
                        NotifCircle(title: "", action: {})

                    }
                })
        }
        .scrollOnlyOnOverflow()
        .padding(.top, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .ignoresSafeArea()
    }
}

struct NotificationMenu_Previews: PreviewProvider {
    static var previews: some View {
        NotificationMenu()
    }
}
