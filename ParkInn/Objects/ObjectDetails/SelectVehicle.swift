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
    
    let title: String
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
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    
                    Text("HG 9292 SHS")
                        .foregroundColor(.gray)
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
            .stroke(Color.white, lineWidth:4))
        .background(Color.white.cornerRadius(20))
        
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
