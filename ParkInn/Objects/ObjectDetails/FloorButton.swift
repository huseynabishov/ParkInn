//
//  FloorButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 21.07.2022.
//

import SwiftUI

struct FloorButton: View {
    
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
                .stroke(Color("AccentColor"), lineWidth:2))
        }
    }
}

struct FloorButton_Previews: PreviewProvider {
    static var previews: some View {
        FloorButton(title: "", action: {})
    }
}
