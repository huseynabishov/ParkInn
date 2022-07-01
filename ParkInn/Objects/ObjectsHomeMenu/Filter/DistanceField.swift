//
//  DistanceField.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 1.07.2022.
//

import SwiftUI

struct DistanceField: View {
    var body: some View {
        VStack(spacing: 0){
            ZStack(){
//            Image(systemName: "rectangle.fill")                        .foregroundColor(Color("AccentColor"))
//                .frame(width: 18, height: 18)
//                .font(.system(size: 30))
                
                Text("")
                    .foregroundColor(Color.white)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .fixedSize(horizontal: true, vertical: false)
                    

            }
            .frame(maxWidth: 60, maxHeight: 25, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 6)
                .stroke(Color("AccentColor")))
            .background(Color("AccentColor"))
            .cornerRadius(6)
            
            
            Image(systemName: "arrowtriangle.down.fill")                        .foregroundColor(Color("AccentColor"))
                .frame(width: 8, height: 8)
                .padding(.bottom, 5)
        }
    }
}

struct DistanceField_Previews: PreviewProvider {
    static var previews: some View {
        DistanceField()
    }
}
