//
//  Welcome.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 19.05.2022.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        ZStack {
            Image("Onboarding")
            .resizable()
            .scaledToFill()
            .frame(width: 390, height: 870, alignment: .center)
            .cornerRadius(10)
            
            Text("Welcome to 👋    ")
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .semibold, design: .rounded))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 380, alignment: .bottomLeading)
                .padding()
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.1)
            Text("ParkInn")
                .foregroundColor(.white)
                .font(.system(size: 90, weight: .semibold, design: .rounded))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 630, alignment: .bottomLeading)
                .padding()
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.1)
            Text("The best parking app of the century for all people in the world.")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 760, alignment: .bottomLeading)
                .padding()
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.1)
            
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
