//
//  CreditCard.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 28.07.2022.
//

import SwiftUI

struct CreditCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct CreditCardFront: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("VISA")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
            }
            
            Spacer()
            
            Text("**** **** **** 2864")
                .foregroundColor(Color.white)
                .font(.system(size: 32))
            
            Spacer()
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text("CARD HOLDER")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    
                    Text("JACK WILLIAMS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                
                Spacer()
                
                VStack {
                    Text("EXPIRES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    Text("02/23")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                
            }
            
            
            
        }.frame(width: 300, height: 200)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("AccentColorP"), Color("AccentColor")] ), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
    }
}

struct CreditCardBack: View {
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding([.top])
            
            Spacer()
            
            HStack {
                
                Text("123")
                    .foregroundColor(Color.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5)
                    .frame(width: 100, height: 20)
                    .background(Color.white)
                
                
                Spacer()
            }.padding()
            
        }.frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue] ), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard<CreditCardBack>(content:  { CreditCardBack() })
    }
}
