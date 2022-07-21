//
//  SecondF.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 22.07.2022.
//

import SwiftUI
import NavigationStack

struct SecondF: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    @State var isSelected: Bool = false
    

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
                
                FloorButton(title: "1st Floor", action: {
                    self.navigationStack.push(SecondF())
                })
                
                FloorButton(title: "2nd Floor", action: {})
                
                FloorButton(title: "3rd Floor", action: {})
            }
            .padding()
            
            Spacer()
            
            Divider()
            
            Spacer()
            
            HStack(spacing: 15){
                CustomButton(title: "Continue", action: {
                    self.navigationStack.push(SelectYourVehicle())
                })
            }
            .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color("ButtonColor"), lineWidth:2))
        })
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct SecondF_Previews: PreviewProvider {
    static var previews: some View {
        SecondF()
    }
}
