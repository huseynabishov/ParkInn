//
//  NotificationButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 18.06.2022.
//

import SwiftUI
import NavigationStack

struct NotificationButton: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        ZStack() {
            Button(action: action) {
            Circle()
                .frame(width: 60, height: 50)
                .foregroundColor(Color.white)
//                .padding()
                .overlay(
                    Image(systemName: "bell")
                        .font(.system(size:25))
                        .foregroundColor(Color("AccentColor"))
                )
            }
        }.frame(width: 60, height: 60)
    }
}

struct NotificationButton_Previews: PreviewProvider {
    static var previews: some View {
        NotificationButton(title: "bell", action: {})
    }
}
