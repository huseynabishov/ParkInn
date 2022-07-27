//
//  AddPaymentButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 28.07.2022.
//

import SwiftUI

struct AddPaymentButton: View {
    
    let title: String
    let action: () -> Void
    var buttonColor: Color = Color("ButtonColor")
    var buttonTextColor: Color = Color.accentColor
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
                
                HStack(spacing: 15){
                    Image(systemName: "plus.app")
                        .font(.system(size: 20))
                Text(title)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .fontWeight(.semibold)
                    .cornerRadius(90)
                
                }
            }
            .padding()
            .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
            .background(Color("ButtonColor"))
            .cornerRadius(90)


        }
    }
}

struct AddPaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentButton(title: "", action: {})
    }
}
