//
//  ParkingDetails.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 2.07.2022.
//

import SwiftUI
import NavigationStack


struct ParkingDetails: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @State private var currentIndex = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                Text("Parking Details")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                
                Spacer()
            }
            .padding()
            
            
            Group{
                TabView(selection: $currentIndex.animation()) {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .overlay(
                            Image("yellowc")
                                .resizable()
                                .scaledToFill()
                        )
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .tag(0)
                    
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .overlay(
                            Image("yellowc")
                                .resizable()
                                .scaledToFill()
                        )
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .tag(1)
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .overlay(
                            Image("yellowc")
                                .resizable()
                                .scaledToFill()
                        )
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .tag(2)
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .overlay(
                            Image("yellowc")
                                .resizable()
                                .scaledToFill()
                        )
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .tag(3)
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .overlay(
                            Image("yellowc")
                                .resizable()
                                .scaledToFill()
                        )
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .tag(4)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .overlay(Fancy5DotsIndexView(numberOfPages: 5, currentIndex: currentIndex)
                )
                
                HStack(){
                    VStack(alignment: .leading, spacing: 10){
                        Text("Parking Lot of San Manolia")
                            .foregroundColor(colorScheme == .light ? .black : .white)                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                        
                        Text("9569, Trantow Courts, San Manolia")
                            .foregroundColor(colorScheme == .light ? .black.opacity(0.6) : .white.opacity(0.6))
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    Button(action: {}) {
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 27))
                    }
                }
                HStack(spacing: 7){
                    ZStack(){
                        HStack{
                            ZStack{
                                Image(systemName: "drop.fill")
                                    .foregroundColor(Color("AccentColor"))
                                    .rotationEffect(.degrees(180))
                                    .font(.system(size: 17))
                                Circle()
                                    .frame(width: 6, height: 6)
                                    .foregroundColor(colorScheme == .light ? Color.white : .black)
                                    .padding(.bottom, 4)
                            }
                            .padding()
                            Spacer()
                        }
                        FilterKindButton(title: "    2 km", action: {
                            self.navigationStack.push(NotificationMenu())
                        })
                    }
                    ZStack(){
                        HStack(){
                            Image(systemName: "stopwatch.fill")
                                .foregroundColor(Color("AccentColor"))
                                .padding()
                            Spacer()
                        }
                        FilterKindButton(title: "       8 AM - 10 PM", action: {
                            self.navigationStack.push(NotificationMenu())
                        })
                    }
                    FilterKindButton(title: "Valet", action: {
                        self.navigationStack.push(NotificationMenu())
                    })
                }
                .padding([.trailing,.leading])
            }
            HStack{
                Text("Description")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                Spacer()
            }
            .padding()
            
            HStack{
                Text("Lorem ipsum dolar sit amet, consectetur adispiscing elit, sed do eiusmad tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolar in cillum pariatur. Duis aute irure dolar in cillum pariatur. Ut enim ad minim veriam, quis nastrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat..." )
                    .foregroundColor(colorScheme == .light ? .black.opacity(0.6) : .white.opacity(0.6))
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding([.leading,.trailing,.bottom])
            }
            Spacer()
            
            VStack(spacing: 5){
                Text("$2.00")
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Text("per hour")
                    .foregroundColor(colorScheme == .light ? .black.opacity(0.6) : .white.opacity(0.6))
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
            }
            .frame(maxWidth: 380, maxHeight: 80, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth:1)
                .foregroundColor(colorScheme == .light ? .white : Color.black))
            .background(Color("ButtonColor").opacity(0.2).cornerRadius(20))
            
            Spacer()
            
            HStack(spacing: 15){
                CustomButton2(title: "Cancel", action: {
                    self.navigationStack.push(NotificationMenu())
                })
                .frame(width: 180, height: 70, alignment: .leading)
                
                
                CustomButton(title: "Book Parking", action: {
                    self.navigationStack.push(SelectYourVehicle())
                })
                .frame(width: 180, height: 70, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(colorScheme == .light ? Color("ButtonColor") : Color.white, lineWidth:2))
            
        })
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
    struct Boarding: View {
        let imageName: String
        let label: String
        let description: String
        let buttonText: String
        @Binding var currentIndex: Int
        @EnvironmentObject private var navigationStack: NavigationStackCompat
        
        var body: some View {
            VStack(){
                Spacer()
                VStack (alignment: .center, spacing: 0, content:{
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300, alignment: .center)
                })
            }
        }
    }
}

struct Fancy5DotsIndexView: View {
    let numberOfPages: Int
    let currentIndex: Int
    
    private let circleSize: CGFloat = 16
    private let circleSpacing: CGFloat = 3
    
    private let primaryColor = Color("AccentColor")
    private let secondaryColor = Color("ButtonColor")
    
    private let smallScale: CGFloat = 0.6
    
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages, id:\.self) { index in
                Capsule()
                    .fill(currentIndex == index ? primaryColor : secondaryColor)
                    .scaleEffect(currentIndex == index ? 1 : smallScale)
                    .frame(width: currentIndex == index ? 40 : 15, height: currentIndex == index ? 10 : 15)
                    .transition(AnyTransition.opacity.combined(with: .scale))
                    .id(index)
            }
        }.padding(.top, 120)
    }
}

struct ParkingDetails_Previews: PreviewProvider {
    static var previews: some View {
        ParkingDetails()
    }
}
