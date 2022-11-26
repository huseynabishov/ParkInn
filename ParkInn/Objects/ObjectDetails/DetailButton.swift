//
//  LocationNameButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 23.06.2022.
//

import SwiftUI

struct DetailButton: View {
    
    let title: String
    let action: () -> Void
    
    @State var styleIndex = 2
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: action) {
            HStack{
                Text(title)
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .fixedSize(horizontal: true, vertical: false)
                    .padding([.leading, .trailing])
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color("AccentColor"), lineWidth:2))
            .cornerRadius(30)
        }
    }
}

struct DetailButton_Previews: PreviewProvider {
    static var previews: some View {
        DetailButton(title: "", action: {})
    }
}
