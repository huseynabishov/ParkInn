//
//  CreateAcc.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 13.06.2022.
//

import SwiftUI
import NavigationStack


struct CreateAcc: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject private var navigationStack: NavigationStack
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        ScrollView{
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
                    Text("Create your Account")
                        .foregroundColor(.black)
                        .font(.system(size: 50, weight: .semibold, design: .rounded))
                        .frame(width: 300, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                    //                    .padding(.top, 130)
                        .padding(.leading, 20)
                    Spacer()
                }
                //            .padding(.bottom,50)
                .padding(.top,67)
                VStack(alignment: .center, spacing: 0, content: {
                    VStack() {
                        TypingField()
                        Spacer()
                        TypingPass()
                    }
                    HStack(){
                        CheckView(title: "")
                        Text("Remember me")
                        
                    }
                    .padding()
                    CustomButton(title: "Sign up", action: {
                        self.navigationStack.push(FillProfile())
                    })
                    .opacity(0.7)
                    .padding()
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
                    .padding(.top, 50)
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
                        Text("Already have an account?")
                            .opacity(0.3)
                        
                        Button(action: {
                            self.navigationStack.push(LoginAcc())
                        }) {
                            Text("Sign in")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color("AccentColor"))
                        }
                    }
                    .padding(.top, 30)
                })
                .padding(.top, 20)
                Spacer()
            })
        }.scrollOnlyOnOverflow()
    }
}

struct CheckView: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName: isChecked ? "checkmark.square.fill": "square")
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 22))
            }
        }
        
    }
}


struct CreateAcc_Previews: PreviewProvider {
    static var previews: some View {
        CreateAcc()
    }
}
