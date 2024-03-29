//
//  CustomButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 11.06.2022.
//

import SwiftUI

struct CustomButton2: View {
    
    let title: String
    let action: () -> Void
    var buttonColor: Color = Color("ButtonColor")
    var buttonTextColor: Color = Color.accentColor
    var iconPath: String?
    var iconBGColorOpacity: Double = 1
    
    @Environment(\.colorScheme) var colorScheme
    
    
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
                    .foregroundColor(colorScheme == .light ? Color("AccentColor") : .white)
                    .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
                    .cornerRadius(90)
                
                
            }
            .padding()
            .background((colorScheme == .light ? buttonColor : .gray.opacity(0.35)))
            .cornerRadius(90)
            .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
        }
    }
    
    struct CustomButton2_Previews: PreviewProvider {
        static var previews: some View {
            CustomButton2(title: "", action: {})    }
        
    }
}
