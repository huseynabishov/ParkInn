//
//  LoginView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 20.05.2022.
//

import SwiftUI
import NavigationStack
import Firebase
import AuthenticationServices
import GoogleSignIn


struct LoginView: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @Environment(\.colorScheme) var colorScheme
    
    @State private var signInWithAppleObject = SignInWithAppleObject()
    
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
                        handleGoogleLogin()
                    }
                    Image("Google")
                        .frame(width: 265, height: 30, alignment: .leading)
                }
                ZStack(){
                    LargeButton(title: "Continue with Apple",
                                backgroundColor: (colorScheme == .light ? Color.white : .gray.opacity(0.3)),
                                foregroundColor: (colorScheme == .light ? Color("ButtonColor") : .gray.opacity(0.5))) {
                        signInWithAppleObject.signInWithApple()
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

struct SignInWithAppleButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton

    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
