//
//  SelectVehicle.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 5.07.2022.
//

import SwiftUI

struct SelectVehicle: View {
    
    @Binding var SelectedVehicle: vehicles
    @State var CurrentVehicle: vehicles
    
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let title2: String
    let action: () -> Void
//    let title2: String
    
    
    var body: some View {
        Button(action: action) {
            HStack(){
                Image("vehicle")
                    .resizable()
                    .frame(width: 90, height: 40)
                    .padding()
                VStack(alignment: .leading,spacing: 10){
                    Text(String(SelectedVehicle == CurrentVehicle  ? (title) : title))
                        .foregroundColor(colorScheme == .light ? .black : .white.opacity(0.6))
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    
                    Text(title2)
                        .foregroundColor(colorScheme == .light ? .gray : .white.opacity(0.6))
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                }
                Spacer()
                
                if SelectedVehicle != CurrentVehicle {
                    Image(systemName: "circle")
                        .font(.system(size: 20))
                        .foregroundColor(Color("AccentColor"))
                } else {
                    Image(systemName: "circle.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(Color("AccentColor"))
                }
                
            }
            .padding()
        }
        .frame(maxWidth: 360, maxHeight: 100, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color("AccentColor"), lineWidth:4))
        .background(colorScheme == .light ? .white : Color.black)
        
        .shadow(
            color: Color.gray.opacity(0.20),
            radius: 10, x: 0, y: 0)
    }
}

struct SelectVehicle_Previews: PreviewProvider {
    static var previews: some View {
        SelectYourVehicle()
    }
}
