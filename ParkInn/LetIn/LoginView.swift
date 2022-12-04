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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        
        VStack(alignment: .center, content: {
            VStack(spacing: 100){
                HStack(){
                    Arrow(title: "arrow.left", action: {
                        self.navigationStack.push(OnboardingScreenView())
                    })
                    Spacer()
                        .frame(width: 330)
                }
                
                .padding()
                
                Text("Let's you in")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                    .frame(width: 350, alignment: .top)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .padding()
            }
            
            VStack(alignment: .center, spacing: 0, content: {
                Spacer()
                ZStack(){
                    LargeButton(title: "Continue with Facebook",
                                backgroundColor: (colorScheme == .light ? Color.white : .gray.opacity(0.3)),
                                foregroundColor: (colorScheme == .light ? Color("ButtonColor") : .gray.opacity(0.5))) {
                        
                    }
                    Image("facebook")
                        .frame(width: 290, height: 30, alignment: .leading)
                }
                ZStack() {
                    LargeButton(title: "Continue with Google",
                                backgroundColor: (colorScheme == .light ? Color.white : .gray.opacity(0.3)),
                                foregroundColor: (colorScheme == .light ? Color("ButtonColor") : .gray.opacity(0.5))) {
                    }
                    Image("Google")
                        .frame(width: 265, height: 30, alignment: .leading)
                }
                ZStack(){
                    LargeButton(title: "Continue with Apple",
                                backgroundColor: (colorScheme == .light ? Color.white : .gray.opacity(0.3)),
                                foregroundColor: (colorScheme == .light ? Color("ButtonColor") : .gray.opacity(0.5))) {
                    }
                    Image(systemName: "applelogo")
                        .font(.system(size: 27))
                        .frame(width: 235, height: 40, alignment: .leading)
                }
                HStack() {
                    Spacer()
                        .frame(height: 1)
                        .background(colorScheme == .light ? Color("ButtonColor") : .gray.opacity(0.3))
                    Text("or")
                        .padding()
                    Spacer()
                        .frame(height: 1)
                        .background(colorScheme == .light ? Color("ButtonColor") : .gray.opacity(0.3))
                }
                CustomButton(title: "Sign in with password ", action: {
                    self.navigationStack.push(LoginAcc())
                    
                })
                .padding()
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
            
            .padding()
            Spacer()
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
