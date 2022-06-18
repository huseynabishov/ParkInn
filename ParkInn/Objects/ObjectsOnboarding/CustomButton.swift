//
//  CustomButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 11.06.2022.
//

import SwiftUI

struct CustomButton: View {
    
    let title: String
    let action: () -> Void
    var buttonColor: Color = Color("AccentColor")
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
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
                    .cornerRadius(90)
                
                
                if(iconPath != nil){
                    Spacer(minLength: 20)
                }
                
            }
            .padding(8)
            .background(buttonColor)
            .cornerRadius(90)
            .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
        }
    }
    
    struct CustomButton_Previews: PreviewProvider {
        static var previews: some View {
            CustomButton(title: "Next", action: {})    }
        
    }
}
