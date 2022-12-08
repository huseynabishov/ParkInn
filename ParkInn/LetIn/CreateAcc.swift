//
//  CreateAcc.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 13.06.2022.
//

import SwiftUI
import NavigationStack
import Firebase
import GoogleSignIn

struct CreateAcc: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    @State var email = ""
    @State var password = ""
    @State private var isSecured: Bool = true
    
    var buttonColor: Color = Color("ButtonColor")
    var typingcolor: Color = Color("typingcolor")
    private var disable : Bool {
        email.count < 7 || password.count < 5
    }
    @Environment(\.colorScheme) var colorScheme
    
//    @EnvironmentObject var signupVM: SignUpViewModel
    
    var body: some View {
        
        ScrollView{
            VStack(content: {
                
                VStack(spacing: 36){
                    HStack(){
                        Arrow(title: "arrow.left", action: {
                            self.navigationStack.push(LoginView())
                        })
                        Spacer()
                            .frame(width: 330)
                    }
                    
                    .padding()
                    Spacer()
                    
                    HStack() {
                        Text("Create your Account")
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.system(size: 50, weight: .semibold, design: .rounded))
                            .frame(width: 300, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .minimumScaleFactor(0.1)
                            .padding()
                        Spacer()
                    }
                }
                
                
                VStack(spacing: 0, content: {
                    VStack() {
                        Section {
                            HStack() {
                                HStack {
                                    
                                    Image(systemName: "envelope.fill")
                                        .opacity(0.3)
                                    
                                    TextField("Email", text: self.$email)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.06).cornerRadius(10))
                            }
                            .padding(.leading)
                            .padding(.trailing)
                            
                            //                            Spacer()
                            
                            HStack() {
                                HStack {
                                    
                                    if isSecured{
                                        Image(systemName: "lock.fill")
                                            .opacity(0.3)
                                            .padding(.leading, 05)
                                        
                                        SecureField("Password", text: self.$password)
                                        
                                        Button(action: {
                                            isSecured.toggle()
                                        }) {
                                            Image(systemName: "eye.slash")
                                                .foregroundColor(.gray)
                                                .opacity(0.5)
                                        }
                                    } else {
                                        Image(systemName: "lock.fill")
                                            .opacity(0.3)
                                            .padding(.leading, 05)
                                        
                                        TextField("Password", text: self.$password)
                                        
                                        Button(action: {
                                            isSecured.toggle()
                                        }) {
                                            Image(systemName: "eye")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.06).cornerRadius(10))
                            }
                            .padding(.leading)
                            .padding(.trailing)
                        }
                    }
                    HStack(){
                        CheckView(title: "")
                        Text("Remember me")
                        
                    }
                    .padding()
                    
                    Section {
                        if (email.count < 7 || password.count < 5) {
                            CustomButton(title: "Sign up", action: {
                                self.navigationStack.push(FillProfile())
                            }).disabled(disable)
                                .opacity(0.7)
                        }
                        else {
                            CustomButton(title: "Sign up", action: {
                                self.navigationStack.push(FillProfile())
                            })
                        }
                    }
                    .padding()
                    
                    HStack() {
                        Spacer()
                            .frame(height: 1)
                            .background(colorScheme == .light ? Color("ButtonColor") : .gray.opacity(0.3))
                            .padding()
                        Text("or continue with")
                        Spacer()
                            .frame(height: 1)
                            .background(colorScheme == .light ? Color("ButtonColor") : .gray.opacity(0.3))
                            .padding()
                    }
                    
                    HStack() {
                        ZStack(){
                            LogosButton(title: "", action: {})
                            Image("facebook")
                                .frame(width: 40, height: 70, alignment: .center)
                        }
                        
                        ZStack(){
                            LogosButton(title: "", action: {
//                                signupVM.signUpWithGoogle()
                                handleGoogleLogin()
                            })
                            Image("Google")
                                .frame(width: 40, height: 70, alignment: .center)
                            
                        }
                        ZStack(){
                            LogosButton(title: "", action: {})
                            Image(systemName: "applelogo")
                                .font(.system(size:27))
                                .frame(width: 40, height: 70, alignment: .center)
                            
                        }
                    }
                    .padding()
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
                    .padding()
                })
                .padding(.top)
                
                Spacer()
            })
        }
    }
    func handleGoogleLogin() {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // Create Google Sign In configuration object.
            let config = GIDConfiguration.init(clientID: clientID)
            
            
            GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { user, err in
                
                if err != nil {
                    print("Error with firebase in google login")
                    print(err?.localizedDescription as Any)
                    return
                }
                
                guard
                    let authentication = user?.user ,
                    let idToken = authentication.idToken
                else {
                    return
                }
                
                let credential = GoogleAuthProvider.credential(withIDToken: "\(idToken)",accessToken: "\(authentication.accessToken)")
                
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if error != nil {
                        print("Error with google login")
                        print(err?.localizedDescription as Any)
//                        completionHandler(.failure(err! as! EmailAuthError))
                    }
                    
                    guard (authResult?.user) != nil else {
//                        completionHandler(.failure(error! as! EmailAuthError))
                        return
                    }
                    
//                    completionHandler(.success(true))
                }
            }
            
        }
    func getRootViewController()-> UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {return .init()}
        
        return root
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
