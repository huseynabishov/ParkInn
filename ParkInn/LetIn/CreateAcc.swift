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
    
    @State var name = ""
    @State var email = ""
    @State var phone = ""
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
            Text("Create your Account")
                .foregroundColor(.black)
                .font(.system(size: 50, weight: .semibold, design: .rounded))
                .frame(width: 300, alignment: .top)
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.1)
                .padding(.top, 130)
            
            TypingField()
            TypingPass()
            
        })
    }
}

struct CreateAcc_Previews: PreviewProvider {
    static var previews: some View {
        CreateAcc()
    }
}
