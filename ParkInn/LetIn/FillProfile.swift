//
//  CreateAcc.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 13.06.2022.
//

import SwiftUI
import NavigationStack


struct FillProfile: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    @State var email = ""
    @State var password = ""
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, content: {
                HStack(){
                    Arrow(title: "arrow.left", action: {
                        self.navigationStack.push(LoginAcc())
                    })
                    .padding(.top)
                    Text("Fill Your Profile")
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .padding(.top)
                    Spacer()
                        .frame(width: 142)
                        
                }
                
                
                VStack(alignment: .center, spacing: 5, content: {
                    Group {
                        ImageUpload()
                            .padding()
                        Spacer()
                            .padding()
                        UsernameObj()
                        Spacer()
                        Nickname()
                        Spacer()
                        DateofBirth()
                        Spacer()
                        EmailFill()
                        Spacer()
                    }
                    Group {
                        PhoneNumber()
                        Spacer()

                    }
                    CustomButton(title: "Continue", action: {
                        self.navigationStack.push(LoginView())
                    })
//                    .opacity(0.7)
                    .padding()
                    
                    .padding(.top)
                })
                .padding(.top)
                Spacer()
            })
        }
    }
}


struct FillProfile_Previews: PreviewProvider {
    static var previews: some View {
        FillProfile()
    }
}
