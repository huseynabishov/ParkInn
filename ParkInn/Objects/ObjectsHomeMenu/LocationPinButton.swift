//
//  LocationPin.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 23.06.2022.
//

import SwiftUI
import NavigationStack

struct LocationPinButton: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        ZStack() {
            Button(action: action) {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("AccentColor"))
                    .overlay(
                        Image(systemName: "location.fill")
                            .font(.system(size:25))
                            .foregroundColor(Color.white)
                            .frame(alignment: .center)
                    )
            }
        }.frame(width: 60, height: 60)
    }
}

struct LocationPinButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationPinButton(title: "target", action: {})
    }
}
