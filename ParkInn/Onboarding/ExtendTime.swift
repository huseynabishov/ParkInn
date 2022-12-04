//
//  ExtendTime.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 20.05.2022.
//

import SwiftUI
import NavigationStack

struct ExtendTime: View {
    
    let ButtonColor = Color("ButtonColor")
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
        Image("ExtendTimee")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300, alignment: .center)
            
            Text("Extend Parking Time As You Need")
                .foregroundColor(colorScheme == .light ? .black : .white)                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .padding()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            
            VStack(alignment: .center, spacing: 62, content: {
                
            Text("Running late? No problem. If you need more time, you can extend your parking via phone, SMS or the app.")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                .padding()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            
            
            VStack(alignment: .center, spacing: 10, content: {
                CustomButton(title: "Next", action: {
                    self.navigationStack.push(LoginView())
                })
            
                CustomButton2(title: "Skip", action: {
                    self.navigationStack.push(LoginView())
                })
            })
            })
        })
    }
}

struct ExtendTime_Previews: PreviewProvider {
    static var previews: some View {
        ExtendTime()
    }
}
