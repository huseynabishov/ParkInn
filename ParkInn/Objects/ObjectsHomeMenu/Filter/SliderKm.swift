//
//  SliderKm.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 30.06.2022.
//

import SwiftUI

struct SliderKm: View {
    
    @State var scale: CGFloat = 0

    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                    Text(String(format: "%.f", scale))
                    Text("km")
                        .font(.headline)
                        .foregroundColor(Color("AccentColor"))
                        .multilineTextAlignment(.center)
                    }
                    ZStack{
                        Slider(value: $scale, in: 0...50, step: 1.0)
                        .frame(width: .infinity, height: 10, alignment: .center)
                        .foregroundColor(Color("ButtonColor"))
                        .cornerRadius(20)
//
                        .padding([.leading, .trailing])
                    }
                }
            }
        }
    }
}

struct SliderKm_Previews: PreviewProvider {
    static var previews: some View {
        SliderKm()
    }
}
