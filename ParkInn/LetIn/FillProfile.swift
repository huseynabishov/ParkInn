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
    @EnvironmentObject private var navigationStack: NavigationStack
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .center, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.push(LoginAcc())
                })
                Text("Fill Your Profile")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.1)
                Spacer()
                    .frame(width: 142)
            }
            
            .padding(.top,11)
            VStack(alignment: .center, spacing: 0, content: {
                Group {
                    ImageUpload()
                    Spacer()
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
                    GenderPick()
                    
                    Spacer()
                }
                CustomButton(title: "Continue", action: {
                    self.navigationStack.push(LoginView())
                })
                .opacity(0.7)
                .padding()
                
                .padding(.top, 30)
            })
            .padding(.top, 20)
            Spacer()
        })
        
    }
}


struct FillProfile_Previews: PreviewProvider {
    static var previews: some View {
        FillProfile()
    }
}
