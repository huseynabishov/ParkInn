//
//  SearchButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 18.06.2022.
//

import SwiftUI
import NavigationStack

struct SearchButton: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack

    let title: String
    let action: () -> Void
    
    
    var body: some View {
        ZStack() {
            Button(action: action) {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.white)
//                .padding()
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .font(.system(size:25))
                        .foregroundColor(Color("AccentColor"))
                )
            }
        }.frame(width: 60, height: 60)
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton(title: "magnifyingglass", action: {})
    }
}
