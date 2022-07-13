//
//  SelectYourVehicle.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 3.07.2022.
//

import SwiftUI
import NavigationStack

enum vehicles {
    case Toyota
    case Ford
    case Honda
    case Tiguan
}

struct SelectYourVehicle: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    @State private var SelectedVehicle: vehicles = .Toyota
    
    var body: some View {
        
        VStack(spacing: 0, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                .padding()
                Text("Select Your Vehicle")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Spacer()
            }
            .padding(.top)
            
            Spacer()
            SelectVehicle(SelectedVehicle: $SelectedVehicle, CurrentVehicle: .Toyota, title: "Toyota Corolla") {
                SelectedVehicle = .Toyota
            }
            
            Spacer()
            SelectVehicle(SelectedVehicle: $SelectedVehicle, CurrentVehicle: .Ford, title: "Ford F Series") {
                SelectedVehicle = .Ford
            }
            
            Spacer()
            SelectVehicle(SelectedVehicle: $SelectedVehicle, CurrentVehicle: .Honda, title: "Honda Civic") {
                SelectedVehicle = .Honda
            }
            
            Spacer()
            SelectVehicle(SelectedVehicle: $SelectedVehicle, CurrentVehicle: .Tiguan, title: "VW Tiguan") {
                SelectedVehicle = .Tiguan
            }
            
            Group{
                Spacer()
                CustomButton2(title: "Add New Vehicle", action: {
                    self.navigationStack.push(SelectYourVehicle())
                })
                .padding()
                Spacer()
                Spacer()
                HStack(spacing: 15){
                    
                    CustomButton(title: "Continue", action: {
                        self.navigationStack.push(BookParkingDetails())
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("ButtonColor"), lineWidth:2))
                
            }
        })        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct SelectYourVehicle_Previews: PreviewProvider {
    static var previews: some View {
        SelectYourVehicle()
    }
}
