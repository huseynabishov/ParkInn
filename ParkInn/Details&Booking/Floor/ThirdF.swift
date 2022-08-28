//
//  ThirdF.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 28.08.2022.
//

import SwiftUI
import NavigationStack

struct ThirdF: View {
    
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
                    self.navigationStack.push(PickParkingSpot())
                })
                
                FloorButton(title: "2nd Floor", action: {
                    self.navigationStack.push(SecondF())
                })
                
                FloorButton(title: "3rd Floor", action: {
                    self.navigationStack.push(ThirdF())
                })
            }
            .padding()
            
            Spacer()
            HStack(spacing: 20){
                HStack(spacing: 10){
                    Text("2 WAY TRAFFIC").kerning(15)
                        .fixedSize()
                        .frame(width: 20, height: 180)
                        .font(.system(size: 19, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.gray.opacity(0.7))
                        .rotationEffect(.degrees(270))
                    
                    VStack(spacing: 20){
                        Text("Entry")
                            .font(.system(size: 19, weight: .semibold, design: .rounded))
                        WayLine()
                    }
                }
                
                VStack(spacing:25){
                    ZStack{
                        
                        SpotScheme()
                            .padding([.leading,.bottom,.top,.trailing])
                        
                        HStack(spacing: 0){
                            
                            VStack(spacing: 20){
                                HStack(spacing: 20){
                                    PickPlaceButton(title: "A01", action: {})
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    
                                }
                                HStack(spacing: 20){
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    
                                }
                                HStack(spacing: 20){
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    PickPlaceButton(title: "A06", action: {})
                                    
                                }
                            }
                        }
                    }
                    horizontalWay()
                    
                    
                    ZStack{
                        
                        SpotScheme()
                            .padding([.leading,.bottom,.top,.trailing])
                        
                        HStack(spacing: 0){
                            
                            VStack(spacing: 20){
                                HStack(spacing: 20){
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    PickPlaceButton(title: "A08", action: {})
                                }
                                HStack(spacing: 20){
                                    PickPlaceButton(title: "A09", action: {})
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    
                                }
                                HStack(spacing: 20){
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    PickPlaceButton(title: "A12", action: {})
                                    
                                }
                            }
                        }
                        
                    }
                }
            }
            
            
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

struct ThirdF_Previews: PreviewProvider {
    static var previews: some View {
        ThirdF()
    }
}
