//
//  OnboardingScreenView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 11.06.2022.
//

import SwiftUI
import NavigationStack


struct OnboardingScreenView: View {
    @State private var currentIndex = 0
       
       
       var body: some View {
           TabView(selection: $currentIndex.animation()) {
               Boarding(imageName: "Map1", label: "Find Parking Places Around You Easily", description: "Find your perfect parking space using our growing database of thousands of car parks, street and metered parking and even private garages!", buttonText: "Next", currentIndex: $currentIndex)
//                   .gesture(DragGesture())
                   .tag(0)
               
               
               Boarding(imageName: "BookPayy", label: "Book and Pay Parking Quickly & Safely", description: "Saving time & money with a guaranteed space waiting just for you: pre-book parking and say goodbye to space hunting and overpaying.", buttonText: "Next", currentIndex: $currentIndex)
//                   .gesture(DragGesture())
                   .tag(1)
               
               Boarding(imageName: "ExtendTimee", label: "Extend Parking Time As You Need", description: "Running late? No problem. If you need more time, you can extend your parking via phone, SMS or the app.", buttonText: "Next", currentIndex: $currentIndex)
//                   .gesture(DragGesture())
                   .tag(2)
           }
           .ignoresSafeArea()
           .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
           .overlay(Fancy3DotsIndexView(numberOfPages: 3, currentIndex: currentIndex))
           
           
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
                       
                       Text(label)
                           .foregroundColor(.black)
                           .font(.system(size: 30, weight: .semibold, design: .rounded))
                           .padding()
                           .multilineTextAlignment(.center)
                           .minimumScaleFactor(0.1)
                       VStack(alignment: .center, spacing: 50, content: {
                       Text(description)
                           .foregroundColor(.black)
                           .font(.system(size: 18, weight: .regular, design: .rounded))
                           .padding()
                           .multilineTextAlignment(.center)
                           .minimumScaleFactor(0.1)
                           
                           Spacer()
                           
                           VStack(alignment: .center, content: {
                       
                       CustomButton(title: buttonText, action: {
                           if currentIndex < 2 {
                               withAnimation { currentIndex += 1 }
                           }
                       })
                       CustomButton2(title: "Skip", action: {
                           self.navigationStack.push(LoginView())
                       })
                           })
                   })
                   })
               }
               .padding(20)
           }
       }
   }
struct Fancy3DotsIndexView: View {
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
        }.padding(.top, 380)
    }
}


struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}
