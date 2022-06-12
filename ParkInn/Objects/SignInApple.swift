//
//  SignInButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 12.06.2022.
//

import SwiftUI

struct SignInApple: View {
    let title: String
    let action: () -> Void
    var buttonColor: Color = Color("ButtonColor")
    var buttonTextColor: Color = Color.white
    var iconPath: String?
    var iconBGColorOpacity: Double = 1
    
    
    var body: some View {
        Button(action: action) {
            HStack(){
                if(iconPath != nil){
                    Image(iconPath!)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color("IconBackground"))
                        .opacity(iconBGColorOpacity)
                        .clipShape(Capsule())
                }
                
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .fontWeight(.semibold)
                    .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("ButtonColor"), lineWidth:1))
                
                
                if(iconPath != nil){
                    Spacer(minLength: 20)
                }
                
            }
        }
    }
    
    struct SignInApple_Previews: PreviewProvider {
        static var previews: some View {
            SignInApple(title: "Continue with Apple", action: {})    }
        
    }
}
