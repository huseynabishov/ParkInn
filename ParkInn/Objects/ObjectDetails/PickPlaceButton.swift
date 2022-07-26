//
//  PickPlaceButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 25.07.2022.
//

import SwiftUI

struct PickPlaceButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 20, weight: .semibold, design: .rounded))
        }
        .frame(maxWidth: 110, maxHeight: 45, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(Color("AccentColor"), lineWidth:4))
        .background(Color("ButtonColor").cornerRadius(10))
    }
}

struct PickPlaceButton_Previews: PreviewProvider {
    static var previews: some View {
        PickPlaceButton(title: "", action: {})
    }
}
