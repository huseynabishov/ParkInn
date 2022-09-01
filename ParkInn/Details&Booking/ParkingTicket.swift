//
//  ParkingTicket.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 1.09.2022.
//

import SwiftUI
import NavigationStack

struct ParkingTicket: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack

    var body: some View {
        VStack(alignment: .center, spacing: 25, content: {
            HStack(){
                Spacer()
                    .frame(width: 15)
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                Spacer()
                    .frame(width: 15)
                Text("Parking Ticket")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Spacer()
                    .frame(width: 8)
                
                Spacer()
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 22))
                Spacer()
                    .frame(width: 10)
            }
            
            Spacer()
            HStack(spacing: 15){
                CustomButton(title: "Navigate to Parking lot", action: {
                    self.navigationStack.push(NotificationMenu())
                })
            }
            .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color("ButtonColor"), lineWidth:2))
        })
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
}

struct ParkingTicket_Previews: PreviewProvider {
    static var previews: some View {
        ParkingTicket()
    }
}
