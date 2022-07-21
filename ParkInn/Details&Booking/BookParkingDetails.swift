//
//  BookParkingDetails.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 11.07.2022.
//

import SwiftUI
import NavigationStack

struct BookParkingDetails: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    @State var currentDate: Date = Date()

    var body: some View {
        VStack(spacing: 0, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                Text("Book Parking Details")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Spacer()
            }
            VStack(spacing: 0) {
                
                CustomDatePicker(currentDate: $currentDate)
            }
//            .padding(.vertical)
            
            HStack(spacing: 15){
                
                CustomButton(title: "Continue", action: {
                    self.navigationStack.push(PickParkingSpot())
                })
            }
            
            .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color("ButtonColor"), lineWidth:2))
        }).ignoresSafeArea(.all, edges: .bottom)
    }
}

struct BookParkingDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookParkingDetails()
    }
}
