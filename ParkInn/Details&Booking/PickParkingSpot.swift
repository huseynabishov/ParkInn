//
//  PickParkingSpot.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 21.07.2022.
//

import SwiftUI
import NavigationStack

struct PickParkingSpot: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    var body: some View {
        VStack(spacing: 0, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                Text("Pick Parking Spot")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Spacer()
            }
            Spacer()
            HStack{
                FloorButton(title: "1st Floor", action: {})
                FloorButton(title: "2nd Floor", action: {})
                FloorButton(title: "3rd Floor", action: {})
            }
            .padding()
            
            Spacer()
        })
    }
}

struct PickParkingSpot_Previews: PreviewProvider {
    static var previews: some View {
        PickParkingSpot()
    }
}
