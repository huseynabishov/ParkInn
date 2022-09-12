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
    
    @EnvironmentObject var vm: BookParkingDetailsModel

    
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
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    PickPlaceButton(title: "A02", action: {})
                                }
                                HStack(spacing: 20){
                                    PickPlaceButton(title: "A03", action: {})
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    
                                }
                                HStack(spacing: 20){
                                    PickPlaceButton(title: "A05", action: {})
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    
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
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    
                                }
                                HStack(spacing: 20){
                                    PickPlaceButton(title: "A11", action: {})
                                    Image("vehicle")
                                        .resizable()
                                        .frame(width: 110, height: 50)
                                    
                                }
                            }
                        }
                        
                    }
                }
            }
            Spacer()
            
            HStack(spacing: 15){
                CustomButton(title: "Continue", action: {
                    self.navigationStack.push(
                        PaymentView()
                            .environmentObject(vm)
                    )
                })
            }
            .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color("ButtonColor"), lineWidth:2))
        })
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct horizontalWay: View {
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "arrow.right")
                .font(.system(size: 30))
                .foregroundColor(Color.gray.opacity(0.6))
            VStack(spacing: 0){
                Divider()
                    .frame(height: 2)
                    .frame(width: 37)
                    .background(Color.gray.opacity(0.3))
            }
            VStack(spacing: 0){
                Divider()
                    .frame(height: 2)
                    .frame(width: 37)
                    .background(Color.gray.opacity(0.3))
            }
            VStack(spacing: 0){
                Divider()
                    .frame(height: 2)
                    .frame(width: 37)
                    .background(Color.gray.opacity(0.3))
            }
            VStack(spacing: 0){
                Divider()
                    .frame(height: 2)
                    .frame(width: 37)
                    .background(Color.gray.opacity(0.3))
            }
        }
    }
}

struct PickParkingSpot_Previews: PreviewProvider {
    static var previews: some View {
        PickParkingSpot()
    }
}
