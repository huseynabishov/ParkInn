//
//  CreatePass.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 16.06.2022.
//

import SwiftUI
import NavigationStack

struct CreatePass: View {
    
@EnvironmentObject private var navigationStack: NavigationStack

    var body: some View {
        VStack(alignment: .center, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    PopView(destination: .ForgotPassword(withId: "childID"))                })
                .padding(.trailing,4)
                Text("Forgot Password")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                Spacer()
                    .frame(width: 110)
            }
        })
               }
               }
               
               struct CreatePass_Previews: PreviewProvider {
            static var previews: some View {
                CreatePass()
            }
        }
