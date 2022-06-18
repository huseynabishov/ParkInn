//
//  ViaEmail.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 15.06.2022.
//

import SwiftUI

struct ViaEmail: View {
    
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        Button(action: action) {
            HStack() {
                ZStack() {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.2)
                        .padding()
                        .overlay(
                            Image(systemName: "envelope.fill")
                                .font(.system(size:25))
                                .cornerRadius(40)
                                .foregroundColor(Color("AccentColor"))
                        )
                }
                VStack(){
                    Text("via Email:")
                        .foregroundColor(.gray)
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .padding(.trailing, 145)
                        .multilineTextAlignment(.leading)
                    
                    Text(String("and***ey@yourdomain.com"))
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .padding(.top,1)
                }
                Spacer()
            }
            .frame(maxWidth: 370, maxHeight: 130, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color("ButtonColor"), lineWidth:2))
        }
    }
}

struct ViaEmail_Previews: PreviewProvider {
    static var previews: some View {
        ViaEmail(title: "", action: {})
    }
}
