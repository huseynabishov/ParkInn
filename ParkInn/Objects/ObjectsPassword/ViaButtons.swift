//
//  ViaButtons.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI

struct ViaButtons: View {
    
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
                            Image(systemName: "message.fill")
                                .font(.system(size: 25))
                                .cornerRadius(40)
                                .foregroundColor(Color("AccentColor"))
                        )
                    HStack(alignment: .center, spacing: 2) {
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundColor(Color.white)
                        
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundColor(Color.white)
                        
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundColor(Color.white)
                    }
                    .padding(.bottom,2)
                }
                VStack(){
                    Text("via SMS:")
                        .foregroundColor(.gray)
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .padding(.trailing, 60)
                        .multilineTextAlignment(.leading)
                    
                    Text("+1 111 ******99")
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

struct ViaButtons_Previews: PreviewProvider {
    static var previews: some View {
        ViaButtons(title: "", action: {})
    }
}
