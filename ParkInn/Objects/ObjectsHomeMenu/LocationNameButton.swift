//
//  LocationNameButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 23.06.2022.
//

import SwiftUI

struct LocationNameButton: View {
    
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        Button(action: action) {
            HStack{
                ZStack{
                    Image(systemName: "drop.fill")
                        .foregroundColor(Color("AccentColor"))
                        .rotationEffect(.degrees(180))
                        .font(.system(size: 17))
                    Circle()
                        .frame(width: 6, height: 6)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 4)
                }
                Text(title)
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .fixedSize(horizontal: true, vertical: false)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color("AccentColor"), lineWidth:2))
        }
    }
}

struct LocationNameButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationNameButton(title: "Home", action: {})
    }
}
