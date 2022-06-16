//
//  CreateAcc.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 13.06.2022.
//

import SwiftUI
import NavigationStack


struct LoginAcc: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject private var navigationStack: NavigationStack
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .center, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.push(LoginView())
                })
                Spacer()
                    .frame(width: 350)
            }
            .padding()
            HStack() {
                Text("Login to your Account")
                    .foregroundColor(.black)
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                    .frame(width: 400, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.1)
//                    .padding(.top, 130)
                    .padding(.leading, 30)
                Spacer()
            }
//            .padding(.bottom,50)
            .padding(.top,67)
            VStack(alignment: .center, spacing: 0, content: {
                VStack() {
                    TypingField()
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Spacer()
                    TypingPass()
                        .padding(.leading, 10)
                        .padding(.trailing, 10)


                }
                HStack(){
                    CheckView(title: "")
                    Text("Remember me")
                    
                }
                .padding()
                
                CustomButton(title: "Sign in", action: {
                    self.navigationStack.push(LoginView())
                })
                .opacity(0.7)
                .padding()
                
                    Button(action: {
                        self.navigationStack.push(ForgotPassword())
                    }) {
                        Text("Forgot the password?")
                            .font(.system(size: 16))
                            .foregroundColor(Color("AccentColor"))
                    }

                HStack() {
                    Spacer()
                        .frame(height: 1)
                        .background(Color("ButtonColor"))
                        .padding()
                    Text("or continue with")
                    Spacer()
                        .frame(height: 1)
                        .background(Color("ButtonColor"))
                        .padding()
                }
                .padding(.top, 30)
                HStack() {
                    ZStack(){
                        LogosButton(title: "", action: {})
                        Image("facebook")
                            .frame(width: 40, height: 70, alignment: .center)
                    }
                    ZStack(){
                        LogosButton(title: "", action: {})
                        Image("Google")
                            .frame(width: 40, height: 70, alignment: .center)
                    }
                    ZStack(){
                        LogosButton(title: "", action: {})
                        Image("Apple")
                            .frame(width: 40, height: 70, alignment: .center)
                    }
                }
                .padding(.top, 30)
                HStack(){
                    Text("Don't have an account?")
                        .opacity(0.3)
                    
                    Button(action: {
                        self.navigationStack.push(CreateAcc())
                    }) {
                        Text("Sign up")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("AccentColor"))
                    }
                }
                .padding(.top, 30)
            })
                        .padding(.top, 20)
            Spacer()
        })
        
    }
}


struct LoginAcc_Previews: PreviewProvider {
    static var previews: some View {
        LoginAcc()
    }
}
