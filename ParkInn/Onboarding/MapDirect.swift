//
//  MapDirect.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 19.05.2022.
//

import SwiftUI

struct MapDirect: View {
    
    let ButtonColor = Color("ButtonColor")
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0, content: {
        Image("Map1")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300, alignment: .center)
            
            
            Text("Find Parking Places Around You Easily")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .padding()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            
            VStack(alignment: .center, spacing: 40, content: {
            Text("Find your perfect parking space using our growing database of thousands of car parks, street and metered parking and even private garages!")
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .padding()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
            
            VStack(alignment: .center, spacing: 10, content: {
            
                Text("Next")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .fontWeight(.semibold)
                .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
                .background(Color.accentColor)
                .cornerRadius(90)
            
//                skipButton
                
            Text("Skip")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(Color.accentColor)
                .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
                .background(ButtonColor)
                .cornerRadius(90)
            })
            })
        })
    }
}

struct MapDirect_Previews: PreviewProvider {
    static var previews: some View {
        MapDirect()
    }
}

//extension MapDirect {
//    private var skipButton: some View {
//
//        NavigationView{
//            ScrollView{
//
////                NavigationLink("Skip", destination: LoginView())
//
//                NavigationLink(destination: LoginView(),
//                               label: {
//                Text("Skip")
//                    .font(.system(size: 20, weight: .semibold, design: .rounded))
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.accentColor)
//                    .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
//                    .background(ButtonColor)
//                    .cornerRadius(90)
//
//
//                })
//
//            }
//            .navigationTitle("Back")
//            .navigationBarHidden(true)
//
//        }
//
//    }
//}
