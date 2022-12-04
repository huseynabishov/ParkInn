//
//  BookPay.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 20.05.2022.
//

import SwiftUI
import NavigationStack
struct BookPay: View {
    
    let ButtonColor = Color("ButtonColor")
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
        Image("BookPayy")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300, alignment: .center)
            
            
            Text("Book and Pay Parking Quickly & Safely")
                .foregroundColor(colorScheme == .light ? .black : .white)                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .padding()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            
            VStack(alignment: .center, spacing: 40, content: {
                
            Text("Saving time & money with a guaranteed space waiting just for you: pre-book parking and say goodbye to space hunting and overpaying.")
                    .foregroundColor(colorScheme == .light ? .black : .white)                .font(.system(size: 18, weight: .regular, design: .rounded))
                .padding()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            
            
            VStack(alignment: .center, spacing: 10, content: {
                CustomButton(title: "Next", action: {
                    self.navigationStack.push(ExtendTime())
                })
            
                
                CustomButton2(title: "Skip", action: {
                    self.navigationStack.push(LoginView())
                })
            })
            })
        })
    }
}

struct BookPay_Previews: PreviewProvider {
    static var previews: some View {
        BookPay()
    }
}
