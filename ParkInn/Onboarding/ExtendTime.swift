//
//  ExtendTime.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 20.05.2022.
//

import SwiftUI

struct ExtendTime: View {
    
    let ButtonColor = Color("ButtonColor")
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
        Image("ExtendTimee")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300, alignment: .center)
            
            Text("Extend Parking Time As You Need")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .padding()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            
            VStack(alignment: .center, spacing: 62, content: {
                
            Text("Running late? No problem. If you need more time, you can extend your parking via phone, SMS or the app.")
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .padding()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            
            
            VStack(alignment: .center, spacing: 10, content: {
            Text("Next")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .fontWeight(.semibold)
                .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
                .background(Color.accentColor)
                .cornerRadius(90)
            
            Text("Skip")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(Color.accentColor)
                .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
                .background(ButtonColor)
                .cornerRadius(90)
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
