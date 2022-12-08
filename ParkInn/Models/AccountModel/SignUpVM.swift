////
////  LoginVM.swift
////  ParkInn
////
////  Created by Huseyn Abishov on 5.12.2022.
////
//
//import SwiftUI
//import Firebase
//import GoogleSignIn
//
//class SignUpViewModel: ObservableObject {
//    
//    @Published var isLogin: Bool = false
//    
//    func signUpWithGoogle() {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        
//        // Create Google Sign In configuration object.
//        let config = GIDConfiguration.init(clientID: clientID)
//        
//        
//        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { [self] user, err in
//            
//            if err != nil {
//                print("Error with firebase in google login")
//                print(err?.localizedDescription as Any)
//                return
//            }
//            
//            guard
//                let authentication = user?. ,
//                let idToken = authentication.idToken
//            else {
//                return
//            }
//            
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,accessToken: authentication.accessToken)
//            
//            Auth.auth().signIn(with: credential) { (authResult, error) in
//                if error != nil {
//                    print("Error with google login")
//                    print(err?.localizedDescription as Any)
////                    completionHandler(.failure(err! as! EmailAuthError))
//                }
//                
//                guard (authResult?.user) != nil else {
////                    completionHandler(.failure(error! as! EmailAuthError))
//                    return
//                }
//                
////                completionHandler(.success(true))
//            }
//            //
//            //        // app clien id
//            //        guard let clientId = FirebaseApp.app()?.options.clientID else { return }
//            //
//            //        // configuration
//            //        let config = GIDConfiguration(clientID: clientId)
//            //        // signIn(with: config, peresenting: ApplicationUtility.rootViewController)
//            //        // SignIn
//            //        GIDSignIn.sharedInstance.signIn(with: config, Presenting: ApplicationUtility.rootViewController) {
//            //            [self] user, err in
//            //
//            //            if let error = err {
//            //                print(error.localizedDescription)
//            //                return
//            //            }
//            //
//            //            guard
//            //                let authentication = user?.authentication,
//            //                let idToken = authentication.idToken
//            //            else { return }
//            //
//            //            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
//            //
//            //            Auth.auth().signIn(with: credential) { result, error in
//            //
//            //                if let err = error {
//            //                    print(err.localizedDescription)
//            //                    return
//            //                }
//            //
//            //                guard let user = result?.user else {return}
//            //                print(user.displayName)
//            //                isLogin.toggle()
//            //            }
//        }
//    }
//}
