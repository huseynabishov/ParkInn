//
//  ForgotPassword.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI
import NavigationStack

struct ForgotPassword: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    
    var body: some View {
        VStack(alignment: .center, content: {
            HStack(){
                
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                                .padding(.trailing,4)
                Text("Forgot Password")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Spacer()
                    .frame(width: 148)
            }
            Image("Password")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 350, alignment: .center)
            VStack() {
            Text("Select which contact details should we use to reset your password")
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .light, design: .rounded))
                .multilineTextAlignment(.leading)
                Spacer()
                    .frame(height: 35)
            ViaButtons(title: "", action: {})
            Spacer()
                .frame(height: 15)
            ViaEmail(title: "", action: {})
            Spacer()
                .frame(height: 20)
            }
            CustomButton(title: "Continue", action: {
                self.navigationStack.push(ForgotFill())
            })
            .opacity(0.7)
            .padding(.bottom,22)
        })
        .padding(.top,16)
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
