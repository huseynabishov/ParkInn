//
//  LoginView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 20.05.2022.
//

import SwiftUI
import NavigationStack


struct LoginView: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    var body: some View {
        
        
        VStack(alignment: .center, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.push(OnboardingScreenView())
                })
                Spacer()
                    .frame(width: 350)
            }
            .padding()
            Text("Let's you in")
                .foregroundColor(.black)
                .font(.system(size: 50, weight: .semibold, design: .rounded))
                .frame(width: 350, alignment: .top)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
                .padding(.top, 130)
            
            VStack(alignment: .center, spacing: 0, content: {
                ZStack(){
                    LargeButton(title: "Continue with Facebook",
                                backgroundColor: Color.white,
                                foregroundColor: Color("ButtonColor")) {
                        
                    }
                    Image("facebook")
                        .frame(width: 290, height: 30, alignment: .leading)
                }
                ZStack() {
                    LargeButton(title: "Continue with Google",
                                backgroundColor: Color.white,
                                foregroundColor: Color("ButtonColor")) {
                    }
                    Image("Google")
                        .frame(width: 265, height: 30, alignment: .leading)
                }
                ZStack(){
                    LargeButton(title: "Continue with Apple",
                                backgroundColor: Color.white,
                                foregroundColor: Color("ButtonColor")) {
                    }
                    Image(systemName: "applelogo")
                        .font(.system(size: 27))
                        .frame(width: 235, height: 40, alignment: .leading)
                }
                HStack() {
                    Spacer()
                        .frame(height: 1)
                        .background(Color("ButtonColor"))
                    Text("or")
                        .padding(20)
                    Spacer()
                        .frame(height: 1)
                        .background(Color("ButtonColor"))
                }
                .padding()
                CustomButton(title: "Sign in with password ", action: {
                    self.navigationStack.push(LoginAcc())
                    
                })
                Spacer()
                
                HStack(){
                    Text("Don't have an account?")
                        .opacity(0.3)
                    
                    
                    Button(action: {
                        self.navigationStack.push(CreateAcc())
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("AccentColor"))
                    }
                }
            })
            .padding(.top, 100)
            Spacer()
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
