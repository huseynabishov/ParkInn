//
//  FilterKindButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 30.06.2022.
//

import SwiftUI

struct FilterKindButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack{
                Text(title)
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .fixedSize(horizontal: true, vertical: false)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color("AccentColor"), lineWidth:5))
            .cornerRadius(30)
        }
    }
}

struct FilterKindButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterKindButton(title: "Distance", action: {})
    }
}
