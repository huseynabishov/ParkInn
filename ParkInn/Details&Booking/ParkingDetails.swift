//
//  ParkingDetails.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 2.07.2022.
//

import SwiftUI
import NavigationStack


struct ParkingDetails: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    @State private var currentIndex = 0
    
    var body: some View {
        VStack(spacing: 0, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                Text("Parking Details")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                
                Spacer()
            }
            .padding()
            
            TabView(selection: $currentIndex.animation()) {
                
                Image("yellowc")
                    .resizable()
                    .frame(width: 370, height: 210, alignment: .center)
                    .cornerRadius(30)
                    .tag(0)
                
                Image("yellowc")
                    .resizable()
                    .frame(width: 370, height: 210, alignment: .center)
                    .cornerRadius(30)
                    .tag(1)
                
                Image("yellowc")
                    .resizable()
                    .frame(width: 370, height: 210, alignment: .center)
                    .cornerRadius(30)
                    .tag(2)
                
                Image("yellowc")
                    .resizable()
                    .frame(width: 370, height: 210, alignment: .center)
                    .cornerRadius(30)
                    .tag(3)
                
                Image("yellowc")
                    .resizable()
                    .frame(width: 370, height: 210, alignment: .center)
                    .cornerRadius(30)
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(Fancy5DotsIndexView(numberOfPages: 5, currentIndex: currentIndex))
            
            HStack(){
                VStack(alignment: .leading, spacing: 10){
                    Text("Parking Lot of San Manolia")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                    
                    
                    Text("9569, Trantow Courts, San Manolia")
                        .multilineTextAlignment(.leading)
                    
                }
                .padding()
                Button(action: {}) {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 27))
                }
            }
            Spacer()
            HStack(spacing: 7){
                FilterKindButton(title: "2 km", action: {
                    self.navigationStack.push(NotificationMenu())
                })
                FilterKindButton(title: "8 AM - 10 PM", action: {
                    self.navigationStack.push(NotificationMenu())
                })
                FilterKindButton(title: "Valet", action: {
                    self.navigationStack.push(NotificationMenu())
                })
            }
            .padding()
            
            HStack{
                Text("Description")
                    .foregroundColor(.black)
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                Spacer()
            }
            .padding()
            
            HStack{
                Text("Lorem ipsum dolar sit amet, consectetur adispiscing elit, sed do eiusmad tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolar in cillum pariatur. Duis aute irure dolar in cillum pariatur. Ut enim ad minim veriam, quis nastrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." )
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Text("Read more...")
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://chargehub.com/en/stations/ca/san-anselmo/parking-lot-at-magnolia-ave-and-kientz-lan.html?locId=41128")!)
                    }
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding()
                
                
            }
        })
        
        
        //        .ignoresSafeArea()
        
        
    }
    struct Boarding: View {
        let imageName: String
        let label: String
        let description: String
        let buttonText: String
        @Binding var currentIndex: Int
        @EnvironmentObject private var navigationStack: NavigationStack
        
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
struct text: View {
    
    @State private var pd = "Lorem ipsum dolar sit amet, consectetur adispiscing elit, sed do eiusmad tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolar in cillum pariatur. Duis aute irure dolar in cillum pariatur. Ut enim ad minim veriam, quis nastrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Read more..."
    
    var attrString: AttributedString {
        var attrS = AttributedString(pd)
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
        }.padding(.top, 170)
    }
}

struct ParkingDetails_Previews: PreviewProvider {
    static var previews: some View {
        ParkingDetails()
    }
}
