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
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
            VStack(alignment: .center, content: {
                HStack(){
                    
                    Arrow(title: "arrow.left", action: {
                        self.navigationStack.pop()
                    })
                    
                    Text("Forgot Password")
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                    Spacer()
                }
                .padding([.top,.leading])

                
                Image("Password")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300, alignment: .center)
                VStack() {
                    Text("Select which contact details should we use to reset your password")
                        .foregroundColor(colorScheme == .light ? .black : .white)                    .font(.system(size: 17, weight: .light, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom)
                        
                    ViaButtons(title: "", action: {})
                        .padding(.bottom)
                        
                    ViaEmail(title: "", action: {})
                        .padding(.bottom)
                        
                }
                CustomButton(title: "Continue", action: {
                    self.navigationStack.push(ForgotFill())
                })
                .opacity(0.7)
                .padding(.bottom)
            })
            .padding(.bottom)
        
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
