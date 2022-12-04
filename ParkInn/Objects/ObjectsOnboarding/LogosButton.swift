//
//  SignInButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 12.06.2022.
//

import SwiftUI

struct LogosButton: View {
    let title: String
    let action: () -> Void
    var buttonColor: Color = Color("ButtonColor")
    var buttonTextColor: Color = Color.white
    var iconPath: String?
    var iconBGColorOpacity: Double = 1
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Button(action: action) {
            HStack(){
                if(iconPath != nil){
                    Image("facebook")
                        .frame(width: 290, height: 30, alignment: .leading)
                        
                }
                
                Text(title)
                    .frame(maxWidth: 90, maxHeight: 70, alignment: .center)
                    .background(colorScheme == .light ? Color.white : .gray.opacity(0.3))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                             
                        .stroke(Color("ButtonColor"), lineWidth:1))
                
                
                if(iconPath != nil){
                    Spacer(minLength: 20)
                }
                    
            }.cornerRadius(20)
                
        }
    }
    
    struct LogosButton_Previews: PreviewProvider {
        static var previews: some View {
            LogosButton(title: "", action: {})    }
        
    }
}
