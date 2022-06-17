//
//  ForgotFill.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 16.06.2022.
//

import SwiftUI
import NavigationStack

struct ForgotFill: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    
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
            .padding(.top, 14)
            Spacer()
            Text("Code has been send to +1 111 ******99")
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .light, design: .rounded))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 50)
            Verification()
            HStack(alignment: .center, spacing: 5) {
                Text("Resend code in")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .multilineTextAlignment(.leading)
                Text("53")
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.leading)
                Text("s")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .multilineTextAlignment(.leading)
            }
            .padding(.top,50)
            Spacer()
            CustomButton(title: "Verify", action: {
                self.navigationStack.push(CreatePass())
            })
            .opacity(0.7)
            .padding(.bottom,21)
        })
    }
}

struct ForgotFill_Previews: PreviewProvider {
    static var previews: some View {
        ForgotFill()
    }
}
